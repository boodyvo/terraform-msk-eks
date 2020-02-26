# Description

## Env

Export your access key and secret key as env variables in shell 
**where you will run terraform commands**   

```bash
export AWS_ACCESS_KEY_ID=access_key
export AWS_SECRET_ACCESS_KEY=secret_key
export AWS_DEFAULT_REGION="eu-central-1"
```

Generate ssh to local:
```bash
ssh-keygen -b 2048 -t rsa -f local -q -N ""
eval "$(ssh-agent -s)"
```

## Provisioning 

To run terraform you need to initialize it first 
from root the directory

```bash
terraform init
```

To check what will be done without and changes:

```
terraform plan
```

To provision the infrastructure:

```
terraform apply
```
Type yes to provision the infrastructure

## Run remote commands

```bash
terraform output -json > tfout.json
```

## Destroy

To destroy the infrastructure:

```
terraform destroy
```