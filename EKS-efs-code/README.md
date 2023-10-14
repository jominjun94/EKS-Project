# EKS-efs-code

## Terraform IAM Policy 적용

```
EKS-terrafom-code/iam-policy.tf

```

## IAM Role 및 EKS내 서비스 어카운트 생성
```
$ eksctl create iamserviceaccount \
--name efs-csi-controller-sa \
--namespace kube-system \
--cluster <EKS Cluster명> \
--attach-policy-arn arn:aws:iam::<AWS 계정 ID>:policy/AmazonEKS_EFS_CSI_Driver_Policy \
--approve \
--override-existing-serviceaccounts \
--region ap-northeast-2
```
## Helm Chart로 AWS EFS CSI Driver 설치

```
$ helm upgrade -i aws-efs-csi-driver aws-efs-csi-driver/aws-efs-csi-driver \
--namespace kube-system \
--set image.repository=602401143452.dkr.ecr.ap-northeast-2.amazonaws.com/eks/aws-efs-csi-driver \
--set controller.serviceAccount.create=false \
--set controller.serviceAccount.name=efs-csi-controller-sa
```
## aws console
![스크린샷 2023-10-14 232733](https://github.com/jominjun94/EKS-Project/assets/72008472/e2dea119-028e-4973-b70f-396aca95a55e)
