variable "common_tags" {
 default = {
    Project = "roboshop"
    Environment = "prod"
    Terraform = true
  }
}

variable "tags" {
  default = {
    component = "web-alb"
  }
}

variable "project_name" {
  default = "roboshop"
}

variable "environment" {
  default = "prod"
}


variable "zone_name" {
  default = "mvaws.online"
}