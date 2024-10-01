terraform {

  required_version = "> 1.8.0"

  required_providers {
    awsaaaaa = {
      source  = "hashicorp/aws"
      version = "5.69.0"
    }
  }

  backend "local" {
    path = "state/terraform.state"
  }
}

resource "local_file" "abc" {
  content  = "123!!"
  filename = "${path.module}/abc.txt"

  lifecycle {
    create_before_destroy = true
  }
}

resource "local_file" "def" {
  depends_on = [local_file.abc]
  content    = "456!"
  filename   = "${path.module}/def.txt"
}