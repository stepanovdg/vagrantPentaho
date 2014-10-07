#!/bin/bash -eux

export old_pwd=$(pwd)
echo $old_pwd
#USER=`whoami`


# create user pentaho/password
useradd -p $(openssl passwd -1 password) pentaho
usermod -u 1016 pentaho
groupmod -g 1016 pentaho
echo "%pentaho ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/vagrant
USER="pentaho"


TMP_DOWNLOAD_FOLDER=/tmp/pentaho
echo $TMP_DOWNLOAD_FOLDER
sudo mkdir $TMP_DOWNLOAD_FOLDER
cd $TMP_DOWNLOAD_FOLDER
sudo sshpass -p "password" scp -r -o StrictHostKeyChecking=no user@epbyminsd0259t1:/media/storage/pentaho-ci/$1-NIGHTLY/LATEST/installers/pentaho-business-*.bin $TMP_DOWNLOAD_FOLDER/pentaho.bin
sudo chmod +x pentaho.bin
sudo chmod 777 pentaho.bin
sudo chown $USER pentaho.bin

echo "unattendedmodeui=none
debuglevel=2
mode=unattended
debugtrace="$TMP_DOWNLOAD_FOLDER/"Debug.log
enable-components=biserver,reportdesigner,pentahoschemaworkbench,pentahodashboard,pentahodataintegration,pentahodataintegrationserver,pentahoanalyzer,pentahointeractivereporting,pentahomobile
disable-components=
installer-language=en
prefix=/opt/Pentaho
hsql_port=9001
postgres_port=5432
postgres_password=admin
monetdb_port=50000
installsampledata=yes
tomcat_server_port=8080
tomcat_server_shutdown_port=8005
tomcat_server_ssl_port=8443
tomcat_server_ajp_port=8009
pdis_server_ssl_port=9443
pdis_server_port=9080
pdis_server_ajp_port=9009
pdis_embedded_db_port=9092" > $TMP_DOWNLOAD_FOLDER/option
#./pentaho.bin --optionfile $TMP_DOWNLOAD_FOLDER/option
./pentaho.bin --optionfile $TMP_DOWNLOAD_FOLDER/option 
cat /tmp/bitrock_installer.log

cd /opt/Pentaho
sudo chown $USER -R /opt/Pentaho
sudo sed -i 's/pg_ctl stop -D/pg_ctl stop -m f -D/g' postgresql/scripts/ctl.sh
sh ctlscript.sh stop
mv java java_back
ln -s $JAVA_HOME java
#Biserver EE 
#FILE=`sudo ls $TMP_DOWNLOAD_FOLDER | grep -xE "biserver-ee-.*"`; sudo mkdir TMP_DOWNLOAD_FOLDER/biserv; sudo unzip $TMP_DOWNLOAD_FOLDER/$FILE -d TMP_DOWNLOAD_FOLDER/biserv

echo $old_pwd
cd $old_pwd