locals {
  resource_name = "${var.project_name}-${var.environment}"
  database_subnet_id     = split(",", data.aws_ssm_parameter.database_subnet_ids.value)[0]
  mysql_sg_id         = data.aws_ssm_parameter.mysql_sg_id.value
  private_subnet_id     = split(",", data.aws_ssm_parameter.private_subnet_ids.value)[0]
  backend_sg_id         = data.aws_ssm_parameter.backend_sg_id.value
  public_subnet_id     = split(",", data.aws_ssm_parameter.public_subnet_ids.value)[0]
  frontend_sg_id         = data.aws_ssm_parameter.frontend_sg_id.value
  ansible_sg_id         = data.aws_ssm_parameter.ansible_sg_id.value
}