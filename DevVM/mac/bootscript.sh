# Install VirtualBox
brew cask install virtualbox

# Install Vagrant
brew cask install vagrant

# Install Vagrant Manager (Optional)
brew cask install vagrant-manager

# Install Git
brew install git

# Install kubernetes client (kubectl)
curl -O https://storage.googleapis.com/kubernetes-release/release/v1.5.7/bin/darwin/amd64/kubectl
chmod +x kubectl
mv kubectl /usr/local/bin/kubectl

# Openssl error on Vagrant 1.8.7 / MacOs Sierra #8013
# https://github.com/mitchellh/vagrant/issues/8013
#sudo ln -sf /usr/local/bin/openssl /opt/vagrant/embedded/bin/openssl

# Setup Kubernetes Cluster (https://github.com/kubernetes/community/blob/master/contributors/devel/local-cluster/vagrant.md)

cd ../..

export KUBERNETES_PROVIDER=vagrant
#curl -sS https://get.k8s.io | bash
wget https://github.com/kubernetes/kubernetes/releases/download/v1.5.7/kubernetes.tar.gz
tar -xvf kubernetes.tar.gz
rm -rf kubernetes.tar.gz

cd kubernetes

export VAGRANT_DEFAULT_PROVIDER=virtualbox
export KUBERNETES_PROVIDER=vagrant
export NUM_NODES=1
./cluster/kube-up.sh

#mkdir /tmp/kube
#cp ~/.kube/config /tmp/kube/
#chmod 766 /tmp/kube/config

# kubectl cluster-info (for information regarding services)

# Jenkins setup
cd ../DevVM/vagrant
vagrant up

# Done and Dusted