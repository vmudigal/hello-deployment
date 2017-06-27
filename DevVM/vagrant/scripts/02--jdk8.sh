# Install JDK 8 (Required for Jenkins)

java -version
if [ $? -ne 0 ]; then
    cd /opt/
    echo "Installing Java 8"
    sudo wget --progress=bar:force --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.rpm"
    sudo yum localinstall -y jdk-8u131-linux-x64.rpm
    rm jdk-8u131-linux-x64.rpm
    
    echo ==============================
    echo  Installed JDK 8 successfully
    echo ==============================
else
    echo ==============================
    echo    JDK 8 already installed
    echo ==============================
fi