# exit script upon any non-zero exit code
set -o errexit

# initialization of terraform
terraform init
terraform get

# format checking of terraform
terraform fmt -recursive
