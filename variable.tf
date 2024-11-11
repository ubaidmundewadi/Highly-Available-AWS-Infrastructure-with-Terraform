variable "REGION" {
  type        = string
  default     = "us-east-1"
  description = "Region to create infra"
}

variable "AMIS" {
  type = map(any)
  default = {
    us-east-1 = "ami-005fc0f236362e99f"
    us-east-2 = "ami-00eb69d236edcfaf8"
  }
  description = "AMI IDS for ubuntu 22 in specific region"
}

variable "PRIVATE_KEY_PATH" {
  default     = "vprofilekey"
  description = "Path to your private key which will be used to login to your instances"
}

variable "PUBLIC_KEY_PATH" {
  default     = "vprofilekey.pub"
  description = "Path to your public key which will be used while launching the instance"
}

variable "USERNAME" {
  type    = string
  default = "ubuntu"
}

variable "MYIP" {
  default = "192.168.1.0/24"
}

variable "rmquser" {
  default = "rabbit"
}

variable "rmqpass" {
  default = "Ub1997@12345678"
}

variable "dbuser" {
  default = "admin"
}

variable "dbpass" {
  default = "admin123"
}

variable "dbname" {
  default = "accounts"
}

variable "instance_count" {
  default = 1
}

variable "VPC_NAME" {
  default = "vprofile-VPC"
}

variable "Zone1" {
  default = "us-east-1a"
}

variable "Zone2" {
  default = "us-east-1b"
}

variable "Zone3" {
  default = "us-east-1c"
}

variable "VpcCIDR" {
  default = "172.21.0.0/16"
}

variable "PubSub1CIDR" {
  default = "172.21.1.0/24"
}

variable "PubSub2CIDR" {
  default = "172.21.2.0/24"
}

variable "PubSub3CIDR" {
  default = "172.21.3.0/24"
}

variable "Priv1SubCIDR" {
  default = "172.21.4.0/24"
}

variable "Priv2SubCIDR" {
  default = "172.21.5.0/24"
}

variable "Priv3SubCIDR" {
  default = "172.21.6.0/24"
}

