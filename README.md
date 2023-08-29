# Install Jenkins on AWS EC2
Jenkins is a self-contained Java-based program, ready to run out-of-the-box, with packages for Windows, Mac OS X and other Unix-like operating systems. As an extensible automation server, Jenkins can be used as a simple CI server or turned into the continuous delivery hub for any project.


### Prerequisites
1. EC2 Instance 
   - With Internet Access
   - Security Group with Port `8080` open for internet
1. Java 11 JDK

## Install Java
1. We will be using open java for our demo, Get the latest version from http://openjdk.java.net/install/
   ```sh
   sudo yum install java-11-amazon-corretto-devel -y
   ```

1. Confirm Java Version and set the java home
   ```sh
   java -version
   find /usr/lib/jvm/java-11-* | head -n 3
   JAVA_HOME=/usr/lib/jvm/java-11-amazon-corretto.x86_64
   export JAVA_HOME
   PATH=$PATH:$JAVA_HOME
    # To set it permanently update your .bash_profile
   vi ~/.bash_profile
   source .bash_profile
   ```
   _The output should be something like this,_
    ```sh
   [root@jenkins-server ~]# java -version
   openjdk version "11.0.19" 2023-04-18 LTS
   OpenJDK Runtime Environment Corretto-11.0.19.7.1 (build 11.0.19+7-LTS)
   OpenJDK 64-Bit Server VM Corretto-11.0.19.7.1 (build 11.0.19+7-LTS, mixed mode)
   ```

## Install Jenkins
 You can install jenkins using the rpm or by setting up the repo. We will set up the repo so that we can update it easily in the future.
1. Get the latest version of jenkins from https://pkg.jenkins.io/redhat-stable/ and install
   ```sh
   sudo yum -y install wget
   sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
   sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
   sudo yum -y install jenkins
   ```

   ### Start Jenkins
   ```sh
   # Start jenkins service
   systemctl  start jenkins

   # Setup Jenkins to start at boot,
   systemctl  enable jenkins
   ```

   ### Accessing Jenkins
   By default jenkins runs at port `8080`, You can access jenkins at
   ```sh
   http://YOUR-SERVER-PUBLIC-IP:8080
   ```
  #### Configure Jenkins
- The default Username is `admin`
- Grab the default password 
- Password Location:`/var/lib/jenkins/secrets/initialAdminPassword`
- `Skip` Plugin Installation; _We can do it later_
- Change admin password
   - `Admin` > `Configure` > `Password`
- Configure `java` path
  - `Manage Jenkins` > `Global Tool Configuration` > `JDK`  
  - 
- Create another admin user id

### Test Jenkins Jobs
1. Create “new item”
1. Enter an item name – `My-First-Project`
   - Chose `Freestyle` project
1. Under the Build section
	Execute shell: echo "Welcome to Jenkins Demo"
1. Save your job 
1. Build job
1. Check "console output"

# Full installation script
```sh
   sudo yum install java-11-amazon-corretto-devel -y
   sudo yum -y install wget
   sudo yum install -y epel-release java-11-openjdk
   sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo
   sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
   sudo yum -y install jenkins
   sudo systemctl  start jenkins
   sudo systemctl  enable jenkins
   sudo yum install git -y
   wget https://releases.hashicorp.com/terraform/1.5.6/terraform_1.5.6_linux_amd64.zip
   unzip terraform_1.5.6_linux_amd64.zip
   sudo mv terraform /usr/local/bin/
   ```

#### Add java to jenkins

```
whereis jvm
```
  #### Configure Jenkins
- Go to the `Manage jenkins`
- 
