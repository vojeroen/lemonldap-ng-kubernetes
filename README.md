**Warning: this repo is not maintained. Feel free to use it as a base to work from, but you will have to take care of any upgrades.**

# LemonLDAP::NG for Kubernetes

This repository contains several Docker images and a Kubernetes config file to deploy [LemonLDAP::NG](https://lemonldap-ng.org) to a Kubernetes cluster.

The configuration is stored using the [LDAP configuration backend](https://lemonldap-ng.org/documentation/latest/ldapconfbackend) in order to keep the LemonLDAP::NG containers completely stateless.

## Requirements
* Kubernetes cluster
* LDAP server (e.g. https://hub.docker.com/r/osixia/openldap)

## Docker images
The Docker images are available on Docker Hub:
* https://hub.docker.com/r/vojeroen/lemonldap-ng-init
* https://hub.docker.com/r/vojeroen/lemonldap-ng-fastcgi
* https://hub.docker.com/r/vojeroen/lemonldap-ng-nginx
* https://hub.docker.com/r/vojeroen/lemonldap-ng-cron

## Deployment
Take a copy of `lemonldap-ng-kubernetes.yaml` and modify it to suit your needs. Then upload the configuration to Kubernetes.
```bash
kubectl apply -f lemonldap-ng-kubernetes.yaml
```
The sample configuration does not expose any services outside of your Kubernetes cluster, so you will have to add Ingresses to actually access LemonLDAP::NG. **It is highly recommended to enable HTTPS in the Ingress configurations.** To function properly, you will need an Ingress for `manager.example.com`, `auth.example.com` and `reload.example.com`, assuming `example.com` is your domain. For the sample applications, you will also need an Ingress for `test1.example.com` and `test2.example.com`. 

Once deployed, you can start configuring the service on `manager.example.com`. Default username and password are "dwho".

See the [LemonLDAP::NG documentation](https://lemonldap-ng.org/documentation/latest/start) for more information. 

## Environment variables
The following variables can be set in the Deployment configuration:

| Name | Description | Container | Mandatory |
| ---- | ----------- | --------- | ----------|
| DOMAIN | The domain LemonLDAP must be deployed to. | init | yes |
| LDAP_CONF_SERVER | The URL of your LDAP server. See the [documentation](https://lemonldap-ng.org/documentation/latest/ldapconfbackend) for more information(parameter ldapServer). | init | yes |
| LDAP_CONF_BASE | The DN where your configuration must be stored. See the [documentation](https://lemonldap-ng.org/documentation/latest/ldapconfbackend) for more information (parameter ldapConfBase). | init | yes |
| LDAP_CONF_BIND_DN | The DN to bind to LDAP. See the [documentation](https://lemonldap-ng.org/documentation/latest/ldapconfbackend) for more information (parameter ldapBindDN). | init | yes |
| LDAP_CONF_BIND_PW | The password to bind to LDAP. See the [documentation](https://lemonldap-ng.org/documentation/latest/ldapconfbackend) for more information (parameter ldapBindPassword). | init | yes |

