# Simple Pipeline Terraform for GCP

# Requirement
* Service Account [GCP](https://console.cloud.google.com/iam-admin/serviceaccounts?authuser=3)
* Terraform installation

### Download credential(*.json) into the directory
```
export GOOGLE_APPLICATION_CREDENTIALS="/home/gilbertobr/testes/Terraform/gcp/install-virtualmin/credential.json"

```

##  Start Terraform settings
```
terraform init
```

## Create Machine
```
terraform apply
```

## Erase machine
```
terraform destroy
```