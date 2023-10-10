# cluster-autoscaler 설치 

## AWS Autoscaling Group내 TAG 설정


```
1. Cluster Autoscaler Tag1 
- Key : k8s.io/cluster-autoscaler/<EKS Cluster명>
- Value : owned
2. Cluster Autoscaler Tag2
- Key : k8s.io/cluster-autoscaler/enabled
- Value : TRUE
```

## Terraform IAM Policy 적용

```
EKS-terrafom-code/iam-policy.tf

```

## IAM Role 및 EKS Service Account 적용

```
 eksctl create iamserviceaccount \
--name cluster-autoscaler \
--namespace kube-system \
--cluster <EKS Cluster명> \
--attach-policy-arn arn:aws:iam::<AWS 계정 ID>: policy/<EFS IAM Policy명> \
--approve \
--override-existing-serviceaccounts \
--region ap-northeast-2
```

##  Cluster Autoscaler 배포 실행 명령어

```
 kubectl apply -f cluster-autoscaler.yaml
```

##  POD 및 Worker Node 개수 실시간 확인


