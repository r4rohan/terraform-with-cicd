#!/bin/sh

sudo google_metadata_script_runner --script-type startup
sudo apt update -y; sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository 'deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable'
sudo apt update -y
sudo apt install docker-ce -y
git clone https://github.com/cloudspannerecosystem/emulator-samples.git
cd /emulator-samples/docker/
sudo sed -i 's/Test Instance/omega-trade-instance/g' start_emulator_with_instance_and_database.sh
sudo sed -i 's/test-instance/omega-trade-instance/g' start_emulator_with_instance_and_database.sh
sudo sed -i 's/test-database/omega-trade-database/g' start_emulator_with_instance_and_database.sh
sudo sed -i 's/test-project/searce-academy/g' start_emulator_with_instance_and_database.sh
sudo docker build -t start-spanner-emulator -f Dockerfile .
sudo docker run --detach --name emulator -p 9010:9010 -p 9020:9020 start-spanner-emulator
gcloud config configurations create emulator-docker
gcloud config set api_endpoint_overrides/spanner http://0.0.0.0:9020/
gcloud config set auth/disable_credentials true
sudo gcloud config set core/project searce-academy