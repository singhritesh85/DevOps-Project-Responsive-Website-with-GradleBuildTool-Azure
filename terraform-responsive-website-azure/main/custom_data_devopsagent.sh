#!/bin/bash
/usr/sbin/useradd -s /bin/bash -m ritesh;
mkdir /home/ritesh/.ssh;
chmod -R 700 /home/ritesh;
echo "ssh-rsa XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX ritesh@DESKTOP-0XXXXXX" >> /home/ritesh/.ssh/authorized_keys;
chmod 600 /home/ritesh/.ssh/authorized_keys;
chown ritesh:ritesh /home/ritesh/.ssh -R;
echo "ritesh  ALL=(ALL)  NOPASSWD:ALL" > /etc/sudoers.d/ritesh;
chmod 440 /etc/sudoers.d/ritesh;
####################################################################
mkdir /mederma;
mkfs.xfs /dev/sdc;
echo "/dev/sdc  /mederma  xfs  defaults 0 0" >> /etc/fstab;
mount -a;
#################################################################### DevOps Agent ###########################################################################
useradd -s /bin/bash -m demo;
echo "Password@#795" | passwd demo --stdin;
yum install -y vim wget zip unzip
yum install java-11* git -y
yum install -y yum-utils
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install -y docker-ce docker-ce-cli containerd.io && systemctl start docker && systemctl enable docker
chown demo:demo /var/run/docker.sock
cd /opt && wget https://services.gradle.org/distributions/gradle-7.1.1-bin.zip
unzip gradle-7.1.1-bin.zip
mv /opt/gradle-7.1.1 /opt/gradle
cd /opt && wget https://github.com/jeremylong/DependencyCheck/releases/download/v8.4.0/dependency-check-8.4.0-release.zip
unzip dependency-check-8.4.0-release.zip
rm -f dependency-check-8.4.0-release.zip
chown -R demo:demo /opt/dependency-check
cd /opt && curl -sfL https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/install.sh | sh -s -- -b /usr/local/bin v0.38.3
echo JAVA_HOME="/usr/lib/jvm/java-11-openjdk-11.0.24.0.8-3.el8.x86_64" >> /home/demo/.bashrc
echo PATH="$PATH:$JAVA_HOME/bin:/opt/gradle/bin:/opt/dependency-check/bin:/usr/local/bin" >> /home/demo/.bashrc
echo "demo  ALL=(ALL)  NOPASSWD:ALL" >> /etc/sudoers 
yum install -y https://packages.microsoft.com/config/rhel/8/packages-microsoft-prod.rpm
yum install -y azure-cli

############# Install kubectl #############

curl -LO https://dl.k8s.io/release/v1.29.2/bin/linux/amd64/kubectl
chmod +x kubectl
mv kubectl /usr/local/bin

############## Install Helm ################

curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 --output /opt/
chmod 700 /opt/get_helm.sh
DESIRED_VERSION=v3.8.0 /opt/get_helm.sh

helm version
kubectl version

