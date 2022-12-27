 terraform {
  backend "s3" {
    bucket = "tfstate4532"
    key    = "path/to/my/key"
    region = "us-east-1"
   access_key = "AKIATC54J5OCI7CSV4JC"
   secret_key = "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"
  }
}

provider "aws" {
 access_key = "AKIATC54J5OCI7CSV4JC"
 secret_key = "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"
 token = "IQoJb3JpZ2luX2VjEOL//////////wEaCXVzLWVhc3QtMSJHMEUCIEB/UG6pco/7oJQzwMldIueRH+V0XWCk3Qs4lK9zfOScAiEApsAoDwR76Y6AEqmuFMOwVpMgblOrZT/yOyuO17bhuy4q6wEIKxAAGgwyMTI0NTg5MjQ5MzIiDGU7ShxvT1jA7cHntCrIAcnXSoeWsDuKCMZBzk/wMhPrie53Qj4Ilwfyvdnj4jEV3Vvl6wosMdRMU9heMPnLWDmeDs956ORlHpRcoIgKmE2T1lnebaQ27sB22/QEZdBsPu/2BGoFDL11gktSjLe+IZJO00dRA63q/vhMfT23wt+eM9EGoW+V+rvjxbgpRfRZQzZMkFtWRrsf4XDFLXc/QqN9EM9tBumwTphaHkAkG2vdmFlsydm6FNIHQYAkYFM+qnz7N7p2mq1WVoYwa6mdzhZIF5UP+nDrMOr4qp0GOpgBasHTEHqBPzBudTPgUVOuh2+g0GZ1oW7FLQx+bBzvipFHtJpJTtKfs5u6FZqdIdRHhq7NsvRBe8IBmYiTfnQhHAyTDaxIvgrrwtPbQSxf/Z4diZ0r2zWRrD+fVy7kEhpXgUE6Sz3zT9sJO81SJuddmGssEn9JbVlaAanzcM1TP5DM78TcoMohIe6/WBsqIQJUGFgdaqYfmZg="
}

# resource "aws_vpc" "my_vpc" {
#   cidr_block = "172.16.0.0/16"

#   tags = {
#     Name = "tf-example"
#   }
# }

# resource "aws_subnet" "my_subnet" {
#   vpc_id            = aws_vpc.my_vpc.id
#   cidr_block        = "172.16.10.0/24"
#   availability_zone = "us-east-1a"

#   tags = {
#     Name = "tf-example"
#   }
# }

# resource "aws_network_interface" "foo" {
#   subnet_id   = aws_subnet.my_subnet.id
#   private_ips = ["172.16.10.100"]

#   tags = {
#     Name = "primary_network_interface"
#   }
# }

resource "aws_instance" "foo" {
  ami           = "ami-0b5eea76982371e91" # us-west-2
  instance_type = "t2.micro"

  network_interface {
    network_interface_id = aws_network_interface.foo.id
    device_index         = 0
  }

  credit_specification {
    cpu_credits = "unlimited"
  }
}
