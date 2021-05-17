# exit script upon any non-zero exit code
set -o errexit

# initialization of terraform
terraform get
terraform init

# format checking of terraform
terraform fmt -recursive