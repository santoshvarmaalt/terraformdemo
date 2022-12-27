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
  # Configuration options
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
