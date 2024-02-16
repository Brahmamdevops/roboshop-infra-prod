module "user" {
  source = "../../roboshop-terraform-app"
  tags = var.tags
  project_name = var.project_name
  common_tags = var.common_tags
  environment = var.environment
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  component_sg_id= data.aws_ssm_parameter.user_sg_id.value
  private_subnet_ids = split(",", data.aws_ssm_parameter.private_subnet_ids.value)
  iam_instance_profile = var.iam_instance_profile
  rule_priority = 20
  zone_name = var.zone_name
  app_alb_listener_arn = data.aws_ssm_parameter.app_alb_listener_arn.value
}