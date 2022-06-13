export TERM=xterm-256color
export CLICOLOR_FORCE=true
export RICHGO_FORCE_COLOR=1

export AWS_ACCOUNT=027709334103
export AWS_REGION=us-east-1
export AWS_PROFILE=default

export AWS_S3_TERRAFORM_BACKEND=pottencial-generaliac

export PROJECT_NAME=poc-atlantis_repo_1

default: prepare init plan apply

prepare:
	@ envsubst < ./config/template/terraform.tf > terraform.tf
	@ envsubst < ./config/template/${ENVIRONMENT}.tfvars > ${ENVIRONMENT}.tfvars
	@ envsubst < ./config/template/shared.auto.tfvars > shared.auto.tfvars

init: 
	@ terraform init -var-file="${ENVIRONMENT}.tfvars"

get:
	@ terraform get -update

fmt:
	@ terraform fmt

validate:
	@ terraform validate

plan:
	@ terraform plan -input=false -var-file="${ENVIRONMENT}.tfvars" -out=create.tfplan

refresh:
	@ terraform refresh -input=false -var-file="${ENVIRONMENT}.tfvars"

apply:
	@ terraform apply -input=false -auto-approve create.tfplan

destroy-plan:
	@ terraform plan -destroy -var-file="terraform-${ENVIRONMENT}.tfvars" -out destroy.tfplan

destroy: destroy-plan
	@ terraform apply destroy.tfplan

output:
	@ terraform output

infracost:
	@ rm -rf .infracost
	@ infracost --usage-file=infracost-usage.yml --show-skipped --terraform-plan-flags="-var-file=terraform-${ENVIRONMENT}.tfvars" breakdown --path .

infracost-sync-usage-file:
	@ infracost --sync-usage-file --usage-file=infracost-usage.yml --terraform-plan-flags="-var-file=terraform-${ENVIRONMENT}.tfvars" breakdown --path .

