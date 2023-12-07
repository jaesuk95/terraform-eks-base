
resource "aws_eks_node_group" "eks-nodegroup" {

    cluster_name    = aws_eks_cluster.eks-cluster.name
    node_group_name = "eks-nodegroup"
    node_role_arn   = aws_iam_role.iam-role-eks-nodegroup.arn
    subnet_ids      = ["subnet-0", "subnet-1"]
    instance_types = ["t2.small"]
    disk_size = 20

    labels = {
        "role" = "eks-nodegroup"
    }

    scaling_config {
        desired_size = 2
        min_size     = 1
        max_size     = 3
    }

    depends_on = [
        aws_iam_role_policy_attachment.iam-policy-eks-nodegroup,
        aws_iam_role_policy_attachment.iam-policy-eks-nodegroup-cni,
        aws_iam_role_policy_attachment.iam-policy-eks-nodegroup-ecr,
    ]

    tags = {
        "Name" = "${aws_eks_cluster.eks-cluster.name}-worker-node"
    }
}

