# AWS Cloud를 활용한 DEVOPS PROJECT
 AWS Cloud 환경에 EKS를 활용하여 DEVOPS 환경을 구축한 프로젝트



## 💻 개발 환경

<div>
<img src="https://img.shields.io/badge/Amazon_AWS-FF9900?style=for-the-badge&logo=amazonaws&logoColor=white">
<img src="https://img.shields.io/badge/kubernetes-%23326ce5.svg?style=for-the-badge&logo=kubernetes&logoColor=white">
<img src="https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white">

<img src="https://img.shields.io/badge/Jenkins-D24939?style=for-the-badge&logo=Jenkins&logoColor=white">
<img src="https://img.shields.io/badge/Argo-EF7B4D?style=for-the-badge&logo=argo&logoColor=white">
<img src="https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white">
<img src="https://img.shields.io/badge/ansible-%231A1918.svg?style=for-the-badge&logo=ansible&logoColor=white">
<img src="https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white">


<img src="https://img.shields.io/badge/Spring-6DB33F?style=for-the-badge&logo=spring&logoColor=white">
<img src="https://img.shields.io/badge/MySQL-005C84?style=for-the-badge&logo=mysql&logoColor=white">
<img src="https://img.shields.io/badge/Postman-FF6C37?style=for-the-badge&logo=postman&logoColor=white">


<img src="https://img.shields.io/badge/Prometheus-E6522C?style=for-the-badge&logo=Prometheus&logoColor=white">
<img src="https://img.shields.io/badge/grafana-%23F46800.svg?style=for-the-badge&logo=grafana&logoColor=white">

</div>

###
###

## ⚙️ 주요 기능
### aws 클라우드 환경 구축

### Terraform 구성 - <a href="https://github.com/jominjun94/EKS-Project/tree/main/EKS-terrafom-code" > 코드 상세 보기 </a>


### ansible - <a href="https://github.com/jominjun94/EKS-Project/tree/main/EKS-ansible-code" > 코드 상세 보기 </a>



### alb - <a href="https://github.com/jominjun94/EKS-Project/tree/main/EKS-alb-code" > 코드 상세 보기 </a>


### EKS-efs-code - <a href="https://github.com/jominjun94/EKS-Project/tree/main/EKS-efs-code" > 코드 상세 보기 </a>



### Jenkins pipeline - <a href="https://github.com/jominjun94/EKS-Project/tree/main/EKS-jenkins-code" > 코드 상세 보기 </a> 

- Jenkins + Ansible 를 활용하여 CI/CD Pipeline 구축
- springboot + docker hub 빌드/배포 

### EKS 클러스터 환경 구축 
- aws의 EKS 환경을 구축하여, docker hub에서 가져온 소스를 
- springboot + docker hub 빌드/배포 
- loadbalacer, ingress, deployment, pv, pvc, serviceaccount, pod, service 등

https://github.com/jominjun94/EKS-Project/tree/main/EKS-k8s-code


### EKS vpc 이중화
- pod 할당 되는 IP 자원에 대한 부족한 현상이 발생을 대비
- pod의 할당 되는 IP는 vpc 이중화를 통해 IP 할당

### Argo cd - <a href="https://github.com/jominjun94/EKS-Project/tree/main/EKS-argo-cd-code" > 코드 상세 보기 </a> 

### Argo rollout- <a href="https://github.com/jominjun94/EKS-Project/tree/main/EKS-argo-rollout-code" > 코드 상세 보기 </a> 


- Argocd를 활용하여, gitops 환경 구축
- pod 관리 등 다양한 소스를 모니터링 하며, 코드로 쿠버네티스를 관리

### HPA + autoscaling- <a href="https://github.com/jominjun94/EKS-Project/tree/main/EKS-HPA-code" > 코드 상세 보기 </a> 

- HPA를 구현하여, 파드의 오토스케일링
- aws autoscaling의 node 오토스케일링 

### prometheus + grafana- <a href="https://github.com/jominjun94/EKS-Project/tree/main/EKS-prome%2Bgrapa" > 코드 상세 보기 </a> 

- metric 서버를 구축하고 metric를 수집하여, 모니터링 환경 구축
- 그라파나를 활용하여 시각화 구성




