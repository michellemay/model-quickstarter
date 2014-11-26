# Checking versions of hadoop and pig
pig -version
hadoop version
# We use elinks to look at the job tracker and screen to collaboratively debug stuff
#sudo apt-get install elinks
#sudo apt-get install screen
sudo yum -y install elinks
sudo yum -y install screen
sudo yum -y install vim
# some dependencies require maven3. will install
sudo mkdir -p /opt/tools
sudo chown hadoop /opt/tools
cd /opt/tools
wget ftp://mirror.csclub.uwaterloo.ca/apache/maven/maven-3/3.2.3/binaries/apache-maven-3.2.3-bin.tar.gz
tar -xzvf apache-maven-3.2.3-bin.tar.gz
export MAVEN_HOME=/opt/tools/apache-maven-3.2.3
export M2_HOME=/opt/tools/apache-maven-3.2.3
export M2=/opt/tools/apache-maven-3.2.3/bin
export PATH=/opt/tools/apache-maven-3.2.3/bin:$PATH
mvn --version
echo -e "export MAVEN_HOME=/opt/tools/apache-maven-3.2.3 \n export M2_HOME=/opt/tools/apache-maven-3.2.3 \n export M2=/opt/tools/apache-maven-3.2.3/bin \n export PATH=/opt/tools/apache-maven-3.2.3/bin:\$PATH" >> ~/.bashrc

# http://rbgeek.wordpress.com/2014/07/16/how-to-install-the-latest-version-of-s3cmd-tool-on-linux/
sudo yum install unzip python-pip
wget https://github.com/s3tools/s3cmd/archive/master.zip
unzip master.zip
cd s3cmd-master/
sudo python setup.py install
sudo pip install python-dateutil
s3cmd --version
s3cmd --configure

rm -rf wdir
mkdir /mnt/wdir
ln -s /mnt/wdir wdir

