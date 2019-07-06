import json
import os

json_file = '/usr/local/lemonldap-ng/data/conf/lmConf-1.json'
ldap_file = "/app/lmConf-1.ldif"

with open(json_file, 'r') as ifile:
    json_config = json.loads(ifile.read())

ldap_header = """
dn: cn=lmConf-1,{base}
objectClass: top
objectClass: applicationProcess
cn: lmConf-1
""".format(base=os.environ.get("LDAP_CONF_BASE", "ou=conf,ou=applications,dc=example,dc=com"))
ldap_config = []

for key, value in json_config.items():
    if isinstance(value, str):
        ldap_config.append("description: {" + key + "}" + value.replace('\n', '\\n') + "\n")
    else:
        ldap_config.append("description: {" + key + "}" + json.dumps(value) + "\n")

ldap_config = (ldap_header + ''.join(sorted(ldap_config))).strip()

with open(ldap_file, 'w') as ofile:
    ofile.write(ldap_config)
