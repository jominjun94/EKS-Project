########### EFS IAM Policy ###########

resource "aws_iam_policy" "my-efs-csi-iam-policy" {
  name = "AmazonEKS_EFS_CSI_Driver_Policy"
  path = "/"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "elasticfilesystem:DescribeAccessPoints",
        "elasticfilesystem:DescribeFileSystems",
        "elasticfilesystem:DescribeMountTargets",
        "ec2:DescribeAvailabilityZones"
      ],
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": [
        "elasticfilesystem:CreateAccessPoint"
      ],
      "Resource": "*",
      "Condition": {
        "StringLike": {
          "aws:RequestTag/efs.csi.aws.com/cluster": "true"
        }
      }
    },
    {
      "Effect": "Allow",
      "Action": [
        "elasticfilesystem:TagResource"
      ],
      "Resource": "*",
      "Condition": {
        "StringLike": {
          "aws:ResourceTag/efs.csi.aws.com/cluster": "true"
        }
      }
    },
    {
      "Effect": "Allow",
      "Action": "elasticfilesystem:DeleteAccessPoint",
      "Resource": "*",
      "Condition": {
        "StringEquals": {
          "aws:ResourceTag/efs.csi.aws.com/cluster": "true"
        }
      }
    }
  ]
  }
POLICY
}

#IAM Role 및 EKS내 서비스 어카운트 생성
$ eksctl create iamserviceaccount \
--name efs-csi-controller-sa \
--namespace kube-system \
--cluster <EKS Cluster명> \
--attach-policy-arn arn:aws:iam::<AWS 계정 ID>:policy/AmazonEKS_EFS_CSI_Driver_Policy \
--approve \
--override-existing-serviceaccounts \
--region ap-northeast-2

#Helm Chart로 AWS EFS CSI Driver 설치
$ helm upgrade -i aws-efs-csi-driver aws-efs-csi-driver/aws-efs-csi-driver \
--namespace kube-system \
--set image.repository=602401143452.dkr.ecr.ap-northeast-2.amazonaws.com/eks/aws-efs-csi-driver \
--set controller.serviceAccount.create=false \
--set controller.serviceAccount.name=efs-csi-controller-sa