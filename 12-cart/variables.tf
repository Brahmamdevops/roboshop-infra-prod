variable "common_tags" {
  default = {
    Project     = "roboshop"
    Environment = "dev"
    Terraform   = "true"
  }
}

variable "project_name" {
  default = "roboshop"
}
variable "environment" {
  default = "dev"
}


variable "tags" {
  default = {
    Component= "cart"
  }
}


variable "zone_name" {
  default = "mvaws.online"
}

variable "iam_instance_profile" {
  default = "EC2instanceforshell"
}