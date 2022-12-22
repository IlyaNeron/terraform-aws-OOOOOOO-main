provider "aws"  {
  region   = var.region
  
  }
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}
resource "aws_instance" "ubuntu" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type1
  subnet_id                   = var.subnet
  associate_public_ip_address = var.associate_public_ip

    tags = merge({ "Name" = format("k.kotov-test -> %s -> %s", substr ("🤔🤷", 0,1), data.aws_ami.ubuntu.name) }, var.tags)
    timeouts {
    create = "10m"
    delete = "15m"
       }
  #tags = merge({ "Name" = "k.kotov"}, var.tags)
 }


resource "aws_ebs_volume" "ebs-volume_for_testing_terraform-AllowFullS3Access" {
  availability_zone = "us-east-1a"
        size = 1
  
  tags = merge({ "Name" = "k.kotov"}, var.tags)
    }

  variable "size_size" {
  default = 1
  }
  
data "aws_iam_policy_document" "bucket_policy" {
  statement {
    sid       = "AllowFullS3Access"
    actions   = ["s3:ListAllMyBuckets"]
    resources = ["*"]
  }
}

variable "letters" {
  description = "a list of letters"
  default = ["a", "b", "c"]
  }

# Convert letters to upper-case as list
output "upper-case-list" {
  value = [for l in var.letters: upper(l)]
sensitive   = true
}

# Convert letters to upper-case as map
output "upper-case-map" {
  value = {for l in var.letters: l => upper(l)}
sensitive   = true
    }
  
  output "hello" {
 value = ["a", "b", "c", "d"]
    }
