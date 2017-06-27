# Install Kubectl

kubectl version
if [ $? -eq 127 ]; then
    sudo curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.5.7/bin/linux/amd64/kubectl
    sudo chmod +x ./kubectl
    sudo mv ./kubectl /usr/local/bin/kubectl

    #sudo mkdir /home/vagrant/kube/
    #sudo cp /tmp/config /home/vagrant/kube/config

    export KUBECONFIG="/home/vagrant/kube/config"
    
    echo ==============================
    echo Installed kubectl successfully
    echo ==============================
else
    echo ===============================
    echo =  kubectl already installed  =
    echo ===============================
fi

#kubectl config set-cluster vagrant-single-cluster --server=https://10.245.1.2:443 --certificate-authority=${PWD}/ssl/ca.pem
#kubectl config set-credentials vagrant-single-admin --certificate-authority=${PWD}/ssl/ca.pem --client-key=${PWD}/ssl/admin-key.pem --client-certificate=${PWD}/ssl/admin.pem
#kubectl config set-context vagrant-single --cluster=vagrant-single-cluster --user=vagrant-single-admin
#kubectl config use-context vagrant-single