# Using Terraform and Ansible to deploy Cloud Run Docker app with authentication

This repository contains code for:

- provisioning GCP services Cloud Run with Identity Aware Proxy
- Deploying to those services using ansible a hello world Shiny app

## Usage

To use this you will need [Terraform](https://www.terraform.io/) installed. 

```bash
# get billing accounts information
gcloud beta billing accounts list

# set an environment variable of your billing account ID
export BILLING_ACCOUNT_ID=XXXXXX-XXXX-XXXXXX

# now run the setup steps
bash setup.sh
```

### Terraform deployment

To deploy the terraform files do the following:

```
terraform init

terraform apply
```

When you're ready to tidy everything up and destroy all infrastructure do:

```bash
terraform destroy
```
