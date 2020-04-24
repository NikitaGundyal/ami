sudo apt-get install -y software-properties-common
sudo add-apt-repository -y ppa:openjdk-r/ppa
sudo apt-get update
sudo apt-get install -y openjdk-11-jdk
which java
echo $JAVA_HOME
#install code-deploy agent
sudo apt-get update
sudo apt-get install -y ruby
sudo apt-get install -y wget
cd /home/ubuntu
wget https://"${S3_Bucket}".s3."${AWS_REGION}".amazonaws.com/latest/install
chmod +x ./install
sudo ./install auto
sudo service codedeploy-agent start
sudo service codedeploy-agent status
#download and install cloudwatch agent
wget https://s3."${AWS_REGION}".amazonaws.com/amazoncloudwatch-agent-"${AWS_REGION}"/ubuntu/amd64/latest/amazon-cloudwatch-agent.deb
sudo dpkg -i -E ./amazon-cloudwatch-agent.deb

