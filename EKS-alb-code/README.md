

# AWS ALB Controller + Ingress ALB 적용 
```
1. 전체 Subnet 적용 Tag 
- Key : kubernetes.io/cluster/<EKS Cluster명>
- Value : shared
2. Public Subnet만 적용하는 Tag
- Key : kubernetes.io/role/elb
- Value : 1
```
## 1. service account 생성
```
eksctl create iamserviceaccount \
--namespace=kube-system \
--cluster=my-eks-cluster \
--name=aws-load-balancer-controller \
--attach-policy-arn=arn:aws:iam::057059131310:policy/my-alb-iam-policy \
--override-existing-serviceaccounts \
--approve

eksctl utils associate-iam-oidc-provider --region=ap-northeast-2 --cluster=my-eks-cluster --approve 

eksctl create iamserviceaccount \
--namespace=kube-system \
--cluster=my-eks-cluster \
--name=aws-load-balancer-controller \
--attach-policy-arn=arn:aws:iam::057059131310:policy/my-alb-iam-policy \
--override-existing-serviceaccounts \
--approve
```

## 2. policy 권한 추가 + (테라폼 alb 권한 EKS-terrafom-code/iam-policy.tf)
```
cat << EOF > alb-iam-patch.json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "elasticloadbalancing:AddTags",
            "Effect": "Allow",
            "Resource": "*",
            "Sid": "patch"
        }
    ]
}
EOF

aws iam put-role-policy --role-name [role name] --policy-name [policy name] --policy-document file://alb-iam-patch.json
```

## 3. helm 설치
```
curl -L https://git.io/get_helm.sh | bash -s -- --version v3.8.
helm repo add eks https://aws.github.io/eks-charts
```
## 4. aws-load-balancer 설치
```
helm install aws-load-balancer-controller eks/aws-load-balancer-controller \
-n kube-system \
--set clusterName=my-eks-cluster \
--set serviceAccount.create=false \
--set serviceAccount.name=aws-load-balancer-controller
```
## 5. Ingress 배포
```
kubectl create ‒f test-ingress.yaml
```