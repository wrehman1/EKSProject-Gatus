data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    actions = [
        "sts:AssumeRole"
    ]

    principals {
      type = "Service"

      identifiers = [
        "ec2.amazonaws.com"
      ]
    }
  }
}

resource "aws_iam_role" "worker" {
  name = var.name

  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_role_policy_attachment" "worker_node" {
  role = aws_iam_role.worker

  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy" 
}

resource "aws_iam_role_policy_attachment" "ecr" {
   role = aws_iam_role.worker.name

   policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryPullOnly"
}

resource "aws_iam_role_policy_attachment" "cni" {
  role = aws_iam_role.worker.name

  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryPullOnly"
}
