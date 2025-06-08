resource "aws_ian_role" "karpenter_node" {
  name = "karpenter-node-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "karpenter_node_AmazonEKSWorkerNodePolicy" {
  role       = aws_iam_role.karpenter_node.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}

resource "aws_iam_instance_profile" "karpenter_node" {
  name = "karpenter-node-profile"
  role = aws_iam_role.karpenter_node.name
}

resource "kubectl_manifest" "karpenter_node_class" {
  yaml_body = <<-YAML
apiVersion: karpenter.k8s.aws/v1beta1
kind: EC2NodeClass
metadata:
  name: ${var.nodeclass_name}
spec:
  amiFamily: AL2
  role: ${aws_iam_role.karpenter_node.arn}
  subnetSelectorTerms:
    - tags:
        "kubernetes.io/cluster/${var.cluster_name}": "owned"
  securityGroupSelectorTerms:
    - tags:
        "kubernetes.io/cluster/${var.cluster_name}": "owned"
  instanceProfile: ${aws_iam_instance_profile.karpenter_node.name}
  tags:
    Name: "karpenter-node"
YAML
}

resource "kubectl_manifest" "karpenter_provisioner" {
  yaml_body = <<-YAML
apiVersion: karpenter.sh/v1alpha5
kind: Provisioner
metadata:
  name: ${var.provisioner_name}
spec:
  requirements:
    - key: "node.kubernetes.io/instance-type"
      operator: In
      values: ${jsonencode(var.instance_types)}
  limits:
    resources:
      cpu: "1000"
  providerRef:
    name: ${var.nodeclass_name}
  ttlSecondsAfterEmpty: 30
YAML
}