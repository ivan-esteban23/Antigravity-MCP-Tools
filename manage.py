#!/usr/bin/env python3
"""Manage the installed Antigravity MCP config without changing repo templates."""
import argparse, copy, datetime, getpass, json, os, pathlib, re, shutil, tempfile, sys, subprocess
ROOT = pathlib.Path(__file__).resolve().parent
DEFAULT = pathlib.Path.home() / '.gemini/config/mcp_config.json'
VARIABLE = re.compile(r'\$\{([A-Z][A-Z0-9_]*)\}')
ALLOWED = {'command','args','env','cwd','headers','authProviderType','oauth','disabled','disabledTools'}
def read(path):
    raw = path.read_text().strip() if path.exists() else ''
    result = json.loads(raw) if raw else {'mcpServers':{}}
    if not isinstance(result,dict) or not isinstance(result.get('mcpServers',{}),dict):
        raise ValueError('Expected a JSON object containing mcpServers.')
    result.setdefault('mcpServers',{})
    return result

def validate(entry):
    if not isinstance(entry,dict): raise ValueError('Server entry must be an object.')
    if bool(entry.get('command')) == bool(entry.get('serverUrl')):
        raise ValueError('Specify exactly one command or serverUrl.')
    if not all(isinstance(x,str) for x in entry.get('args',[])):
        raise ValueError('args must contain strings.')
    extra=set(entry)-ALLOWED-{'serverUrl'}
    if extra:raise ValueError('Unsupported Antigravity fields: '+', '.join(sorted(extra)))

def write(path, data):
    path.parent.mkdir(parents=True,exist_ok=True)
    if path.exists():
        stamp=datetime.datetime.now(datetime.timezone.utc).strftime('%Y%m%dT%H%M%S%fZ')
        shutil.copy2(path,path.with_name(path.name+'.backup-'+stamp))
    with tempfile.NamedTemporaryFile(mode='w',dir=path.parent,delete=False) as f:
        json.dump(data,f,indent=2);f.write('\n');temporary=pathlib.Path(f.name)
    os.chmod(temporary,0o600);os.replace(temporary,path)

def substitute(value, values):
    if isinstance(value,str):return VARIABLE.sub(lambda m:values[m.group(1)],value)
    if isinstance(value,list):return [substitute(v,values) for v in value]
    if isinstance(value,dict):return {k:substitute(v,values) for k,v in value.items()}
    return value

def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--config',type=pathlib.Path,default=DEFAULT)
    sub=parser.add_subparsers(dest='action',required=True)
    sub.add_parser('list')
    sub.add_parser('image-only', help='Enable only the Nano Banana image MCP after local setup checks')
    for verb in ['enable','disable','setup']:
        p=sub.add_parser(verb);p.add_argument('name')
    p=sub.add_parser('import');p.add_argument('name');p.add_argument('file',type=pathlib.Path)
    args=parser.parse_args();catalog=json.loads((ROOT/'catalog.json').read_text())
    data=read(args.config);servers=data['mcpServers']
    if args.action=='image-only':
        binary=shutil.which('mcp-nanobanana-go')
        if not binary:
            raise ValueError('Missing mcp-nanobanana-go. Install the official Genmedia binary and add ~/.local/bin to PATH. See IMAGE_GENERATION.md.')
        gcloud=shutil.which('gcloud')
        if not gcloud:
            raise ValueError('Missing gcloud. Install Google Cloud CLI and follow IMAGE_GENERATION.md.')
        auth=subprocess.run([gcloud,'auth','application-default','print-access-token'],stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL,timeout=45)
        if auth.returncode:
            raise ValueError('Google application credentials are missing or expired. Run: gcloud auth application-default login')
        old=servers.get('genmedia-nanobanana',{})
        old_env=old.get('env',{})
        project=os.environ.get('GOOGLE_CLOUD_PROJECT') or old_env.get('GOOGLE_CLOUD_PROJECT') or old_env.get('PROJECT_ID','')
        if not project or VARIABLE.search(project):
            project=input('Google Cloud project ID: ').strip()
        if not project or VARIABLE.search(project):
            raise ValueError('A Google Cloud project ID is required. No changes made.')
        region=os.environ.get('GOOGLE_CLOUD_LOCATION') or old_env.get('GOOGLE_CLOUD_LOCATION') or old_env.get('LOCATION','')
        if not region or VARIABLE.search(region):
            region=input('Vertex AI location [us-central1]: ').strip() or 'us-central1'
        if VARIABLE.search(region):raise ValueError('Supply an actual region. No changes made.')
        env=dict(old_env)
        env.pop('PROJECT_ID',None);env.pop('LOCATION',None)
        if VARIABLE.search(env.get('GENMEDIA_BUCKET','')):env.pop('GENMEDIA_BUCKET',None)
        env['GOOGLE_CLOUD_PROJECT']=project;env['GOOGLE_CLOUD_LOCATION']=region
        entry={'command':binary,'args':[],'env':env,'disabled':False}
        validate(entry)
        for definition in servers.values():definition['disabled']=True
        servers['genmedia-nanobanana']=entry
        write(args.config,data)
        print('Enabled only genmedia-nanobanana. All other MCP servers are disabled. Backup saved. Restart agy and open /mcp.')
        return
    if args.action=='list':
        for name,d in sorted(servers.items()):print(name+': '+('disabled' if d.get('disabled',False) else 'enabled'))
        for e in catalog['servers']:
            if e['status']=='manual-setup-required':print(e['id']+': vendor configuration needed, '+e['source_url'])
        return
    if args.action=='import':
        raw=json.loads(args.file.read_text())
        if 'mcpServers' in raw:
            choices=raw['mcpServers']
            if args.name in choices:entry=copy.deepcopy(choices[args.name])
            elif len(choices)==1:entry=copy.deepcopy(next(iter(choices.values())))
            else:raise ValueError('Export has multiple servers. Use a matching server name or a one-server export.')
        else:entry=copy.deepcopy(raw)
        if 'url' in entry:entry['serverUrl']=entry.pop('url')
        entry.pop('type',None)
        entry['disabled']=True;validate(entry);servers[args.name]=entry
        write(args.config,data);print('Imported disabled server:',args.name);return
    if args.name not in servers:raise ValueError('Server not installed. Run install.sh or import its vendor config.')
    entry=servers[args.name]
    if args.action=='disable':entry['disabled']=True
    else:
        variables=sorted(set(VARIABLE.findall(json.dumps(entry))))
        values={}
        for name in variables:
            value=os.environ.get(name)
            if not value:
                if args.action=='enable':raise ValueError('Run setup '+args.name+' first. Missing value: '+name)
                value=getpass.getpass(name+' (local input, hidden): ')
            if not value:raise ValueError('A required value is empty: '+name)
            values[name]=value
        entry=substitute(entry,values);validate(entry)
        if 'command' in entry and not shutil.which(entry['command']):
            raise ValueError('Executable missing from PATH: '+entry['command'])
        if entry.get('serverUrl') and not entry['serverUrl'].startswith(('https://','http://localhost','http://127.0.0.1')):
            raise ValueError('Expected an HTTPS endpoint or local HTTP server.')
        entry['disabled']=False;servers[args.name]=entry
    write(args.config,data)
    print('Updated',args.name+'. Restart Antigravity and inspect /mcp. Authentication is separate.')
if __name__=='__main__':
    try:main()
    except (ValueError,OSError,json.JSONDecodeError,subprocess.TimeoutExpired) as exc:
        print(str(exc),file=sys.stderr);sys.exit(1)
