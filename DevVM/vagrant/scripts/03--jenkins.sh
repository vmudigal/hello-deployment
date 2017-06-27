# Install Jenkins
cd ~
sudo wget --no-verbose -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo
sudo rpm --import http://pkg.jenkins-ci.org/redhat-stable/jenkins-ci.org.key

sudo yum update -y yum.noarch
sudo yum -y install jenkins

sudo systemctl start jenkins.service
sudo systemctl enable jenkins.service

echo 'jenkins ALL=(ALL) NOPASSWD: ALL' | sudo tee --append /etc/sudoers > /dev/null

echo ==============================
echo Installed Jenkins successfully
echo ==============================