![e82e7444834d0e24](https://github.com/jominjun94/EKS-Project/assets/72008472/711cbb53-0bbf-4ed4-8810-184f776c67a9)
# Metrics Server 설치
```
$ kubectl apply ‒f metrics-server.yaml
```

## Terraform IAM Policy 적용

```
EKS-terrafom-code/iam-policy.tf

```

## 테스트용 Pod 배포 경로
```
$ kubectl apply -f test-deploy.yaml
HPA 적용 명령어
$ kubectl autoscale deployment test-deploy --cpu-percent=50 --min=1 --max=10
```
![e82e7444834d0e24](https://github.com/jominjun94/EKS-Project/assets/72008472/941ed6bf-9a30-4d4f-abd5-15d7d6eae9b0)
