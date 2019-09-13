

# Installing kubernetes

sudo apt-get update && sudo apt-get install -y apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl


curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_1.3.1.deb \
 && sudo dpkg -i minikube_1.3.1.deb

sudo minikube config set vm-driver none


bash <(curl -sL  https://www.eclipse.org/che/chectl/)

chectl --version


minikube start --memory=4096

chectl server:start --multiuser
