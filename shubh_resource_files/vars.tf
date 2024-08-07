variable "REGION" {
  default = "ap-south-1"
}

variable "ZONE1" {
  default = "ap-south-1a"
}

variable "ZONE2" {
  default = "ap-south-1b"

}

variable "ZONE3" {
  default = "ap-south-1c"
}

variable "AMIs" {
  type = map(any)
  default = {
    ap-south-1 = "ami-025fe52e1f2dc5044"
    us-east-2  = "ami-0c11a84584d4e09dd"
  }
}

variable "INST_TYPE" {
  default = "t2.micro"
}

variable "user" {
  default = "ec2-user"
}

variable "PUB_KEY" {
  default = "terra-key.pub"
}

variable "PRI_KEY" {
  default = "terra_key"
}

/**variable "MYIP" {
  default = "152.57.xxx.xxx/32"
}
**/