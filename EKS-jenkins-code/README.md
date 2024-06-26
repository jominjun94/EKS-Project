# jenkins


- Springboot를 활용한 간단한 backend 구성 + 테스트 진행 시 postman 사용
- docker 와 docker volume 를 활용하여, 젠킨스 마스터를 구성합니다. 
- docker로 구성된 jenkins master는 빌드 수행 시 jenkins node로 전달합니다.
![스크린샷 2023-10-14 234734](https://github.com/jominjun94/EKS-Project/assets/72008472/4d757eb4-44d8-41e2-8cb2-e1dba92c0dad)

- jenkins script를 활용하여, jenkins를 구성하고 관리합니다.  


## jenkins master + slave 구성 

### 젠킨스 파이프 라인

![4bdbbad4397c1522](https://github.com/jominjun94/EKS-Project/assets/72008472/4fa923b0-5817-447e-82f2-852c38344595)

### 젠킨스 노드 구성

![스크린샷 2023-10-15 001039](https://github.com/jominjun94/EKS-Project/assets/72008472/531d1540-2e1e-4134-a712-9c87c43f9a26)

### 1. deploy-dockerHub
- jenkins를 활용하여, maven 빌드를 진행합니다. 
- 빌드 이후 나온 jar 파일을 image로 구성하여 ansible를 사용하여 docker hub에 이미지를 저장합니다. 
- https://github.com/jominjun94/EKS-Project/blob/main/EKS-jenkins-code/backend/deploy-dockerHub/Jenkinsfile
- https://github.com/jominjun94/EKS-Project/blob/main/EKS-ansible-code/create-cicd-project-image-playbook-backend.yml
### 2. deploy-k8s
- ansible playbook 를 깃헙에서 clone 이후 ec2 console 환경으로 이동시켜 kubectl 를 사용하여 EKS에 배포합니다. 
- https://github.com/jominjun94/EKS-Project/blob/main/EKS-jenkins-code/backend/deploy-k8s/Jenkinsfile
- https://github.com/jominjun94/EKS-Project/blob/main/EKS-ansible-code/argo-cd-deploy-playbook-backend.yml

</br>

# jenkins 설치 - 도커 사용 o 
```
docker pull jenkins/jenkins:lts
sudo docker run -d -p 8080:8080 -v /jenkins:/var/jenkins_home --name jenkins -u root jenkins/jenkins:lts
sudo docker exec -it jenkins /bin/bash
cat /var/jenkins_home/secrets/initialAdminPassword
```
![스크린샷 2023-10-14 235956](https://github.com/jominjun94/EKS-Project/assets/72008472/b5e1308c-a7fd-466c-8257-f5d18fff2eaa)

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
![스크린샷 2023-10-14 234132](https://github.com/jominjun94/EKS-Project/assets/72008472/aa467a65-f8a3-44e3-9828-23f9f7d76086)
 

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
![스크린샷 2023-10-14 233528](https://github.com/jominjun94/EKS-Project/assets/72008472/b377290d-55aa-4109-af7f-51bc0e526b6a)

