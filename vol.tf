provider "aws" {
  region = "ap-south-1"
  profile = "rishabh"
}


resource "aws_efs_file_system" "foo" {
  creation_token = "my-product"

  tags = {
    Name = "rishuv1"
  }
}

resource "aws_efs_mount_target" "alpha" {
  file_system_id = aws_efs_file_system.foo.id
  subnet_id      = aws_subnet.alpha.id
}
resource "aws_vpc" "foo" {
  cidr_block = "172.31.0.0/16"
}

resource "aws_subnet" "alpha" {
  vpc_id            = aws_vpc.foo.id
  availability_zone = "ap-south-1c"
  cidr_block        = "172.31.16.0/20"
}



