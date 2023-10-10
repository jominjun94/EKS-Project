
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