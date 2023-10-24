## Packer and Ansible 
### baking ubuntu ami with dev tool installed, ansible role responsible to download and install dev packages

```
packer build \
    -var "infra_env=staging" \
    cloudcasts-app.json

```