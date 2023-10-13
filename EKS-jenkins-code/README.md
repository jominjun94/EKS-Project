# jenkins
- Springboot를 활용한 간단한 backend 구성 + 테스트 진행 시 postman 사용
- docker 와 docker volume 를 활용하여, 젠킨스 마스터를 구성합니다. 
- docker로 구성된 jenkins master는 빌드 수행 시 jenkins node로 전달합니다.
- jenkins script를 활용하여, jenkins를 구성하고 관리합니다.  


## jenkins master + slave 구성 

### 1. deploy-dockerHub
- jenkins를 활용하여, maven 빌드를 진행합니다. 
- 빌드 이후 나온 jar 파일을 image로 구성하여 ansible를 사용하여 docker hub에 이미지를 저장합니다. 

### 2. deploy-k8s
 - ansible playbook 를 깃헙에서 clone 이후 ec2 console 환경으로 이동시켜 kubectl 를 사용하여 EKS에 배포합니다. 


</br>
# jenkins 설치 - 도커 사용 o 
```
docker pull jenkins/jenkins:lts
sudo docker run -d -p 8080:8080 -v /jenkins:/var/jenkins_home --name jenkins -u root jenkins/jenkins:lts
sudo docker exec -it jenkins /bin/bash
cat /var/jenkins_home/secrets/initialAdminPassword
```
# jenkins 설치 - 도커 사용 x 서버에 직접 설치
```
sudo apt-get update
sudo apt-get install openjdk-11-jdk
wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
echo deb http://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 5BA31D57EF5975CA

sudo apt-get update -> 하면 키가 나옵니다 그 키를 위에 다시 넣고 시작
sudo apt-get install jenkins

sudo systemctl start jenkins
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```

 

## jenkins 서버 내 설치 
### git 설치
```
sudo apt-get install -y git
```


### java maven 설치 
```
sudo apt install -y maven
```

### ansible 설치
```
sudo add-apt-repository ppa:ansible/ansible
sudo apt install ansible -y
```


### Docker 설치
```
sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
sudo groupadd docker
sudo usermod -aG docker ${USER}
newgrp docker
```

### ssh-keygen
```
ssh-keygen -t ed25519
```
