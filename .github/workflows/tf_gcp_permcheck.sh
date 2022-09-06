# exit if any of the commands fails
set -o errexit

#show missing perms
terraform plan  2>&1 |grep forbidden |sed "s/\(.*\)Required '\([a-z.]*\)' permission\(.*\)/\2/" |tr '\n' ',' |sed 's/,$/\n/'
