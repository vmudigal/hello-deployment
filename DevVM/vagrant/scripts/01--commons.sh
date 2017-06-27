# Install wget
sudo yum -y install wget

# Install pip
sudo yum -y --enablerepo=extras install epel-release
sudo yum -y install python-pip
sudo pip install --upgrade pip

# Install Git
sudo yum -y install git