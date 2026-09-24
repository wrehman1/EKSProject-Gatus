terraform {
  backend "s3" {
    use_lockfile = true
    bucket       = "gatusapp-eks-tfstate-bucket"
    key          = "gatus/infra/terraform.tfstate"
    region       = "eu-west-2"
    encrypt      = true
  }
}