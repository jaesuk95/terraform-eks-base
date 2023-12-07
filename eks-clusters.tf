resource "aws_eks_cluster" "eks-cluster" {

    depends_on = [ 
        aws_iam_role_policy_attachment.iam-policy-eks-cluster,
        aws_iam_role_policy_attachment.iam-policy-eks-cluster-vpc,
    ]

    name = "eks-cluster"
    role_arn = aws_iam_role.iam-role-eks-cluster.arn
    version = "1.28"
    enabled_cluster_log_types = [ "api", "audit", "authenticator", "controllerManager", "scheduler" ]

    vpc_config {
      security_group_ids = [aws_security_group.test-sg-eks-cluster.id]
      subnet_ids = ["subnet-0", "subnet-1"]
      endpoint_public_access = true
    }
    
}