############ eks cluster iam role ############

resource "aws_iam_role" "iam-role-eks-cluster" {
  name = "iam-role-eks-cluster"

  assume_role_policy = <<POLICY
{
"Version": "2012-10-17",
"Statement": [
    {
    "Effect": "Allow",
    "Principal": {
        "Service": "eks.amazonaws.com"
    },
    "Action": "sts:AssumeRole"
    }
]
}
POLICY
}
 
# 권한 정책 
# Cluster policy
resource "aws_iam_role_policy_attachment" "iam-policy-eks-cluster" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.iam-role-eks-cluster.name
}

# VPCResourceController 
resource "aws_iam_role_policy_attachment" "iam-policy-eks-cluster-vpc" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
  role       = aws_iam_role.iam-role-eks-cluster.name
}


############ eks nodegroup iam role ############

resource "aws_iam_role" "iam-role-eks-nodegroup" {
  name = "iam-role-eks-nodegroup"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

# resource "aws_iam_policy" "iam-policy-eks-nodegroup-custom" {
#   name        = "iam-policy-eks-nodegroup-custom"
#   description = "Custom policy for EKS worker nodes"
#   policy = <<POLICY
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Effect": "Allow",
#       "Action": "ec2:CreateVolume",
#       "Resource": "*"
#     }
#   ]
# }
# POLICY
# }

# more policy
resource "aws_iam_role_policy_attachment" "iam-policy-eks-nodegroup" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.iam-role-eks-nodegroup.name
}

resource "aws_iam_role_policy_attachment" "iam-policy-eks-nodegroup-cni" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.iam-role-eks-nodegroup.name
}

resource "aws_iam_role_policy_attachment" "iam-policy-eks-nodegroup-ecr" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.iam-role-eks-nodegroup.name
}

# resource "aws_iam_role_policy_attachment" "iam-policy-eks-nodegroup-ebs" {
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEBSCSIDriverPolicy"
#   role       = aws_iam_role.iam-role-eks-nodegroup.name
# }
