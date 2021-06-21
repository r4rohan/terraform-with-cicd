# exit script upon any non-zero exit code
set -o errexit

# format checking of terraform
terraform fmt -recursive -diff
