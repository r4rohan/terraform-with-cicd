#Work flow
Create a branch
make changes to branch 
push branch
if all checks pass,open PR to staging
run tests on staging
if it passes, open PR from staging to main
merge main


Project directories
Each new project needs to have (at a minimum) the directory name (in providers.tf) and the gcp_instance_id (in variables.tf) and a variable "active"


#todo
protect main branch
protect staging branch
enforce precommit hooks
create bash aliases for creating a branch
create bash aliases for opening a PR 
create bash aliases for staging to main PR

