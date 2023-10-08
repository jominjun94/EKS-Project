########### Cluster Autoscaler IAM Policy ###########

resource "aws_iam_policy" "my-iam-policy-cluster-autoscaler" {
  name = "my-iam-policy-cluster-autoscaler"
  path = "/"

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "autoscaling:DescribeAutoScalingGroups",
                "autoscaling:DescribeAutoScalingInstances",
                "autoscaling:DescribeLaunchConfigurations",
                "autoscaling:DescribeTags",
                "autoscaling:SetDesiredCapacity",
                "autoscaling:TerminateInstanceInAutoScalingGroup",
                "ec2:DescribeLaunchTemplateVersions"
            ],
            "Resource": "*",
            "Effect": "Allow"
        }
    ]
}
POLICY
}


#IAM Role 및 EKS Service Account 적용
$ eksctl create iamserviceaccount \
--name cluster-autoscaler \
--namespace kube-system \
--cluster <EKS Cluster명> \
--attach-policy-arn arn:aws:iam::<AWS 계정 ID>: policy/<EFS IAM Policy명> \
--approve \
--override-existing-serviceaccounts \
--region ap-northeast-2


