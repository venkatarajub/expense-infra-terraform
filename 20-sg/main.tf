module "mysql_sg" {
    source = "../../sg-module-terraform"
    project_name = var.project_name
    environment = var.environment
    sg_name = "mysql"
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    common_tags = var.common_tags
    sg_tags = var.mysql_sg_tags
}

module "backend_sg" {
    source = "../../sg-module-terraform"
    project_name = var.project_name
    environment = var.environment
    sg_name = "backend"
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    common_tags = var.common_tags
    sg_tags = var.backend_sg_tags
}

module "frontend_sg" {
    source = "../../sg-module-terraform"
    project_name = var.project_name
    environment = var.environment
    sg_name = "frontend"
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    common_tags = var.common_tags
    sg_tags = var.frontend_sg_tags
}

module "bastion_sg" {
    source = "../../sg-module-terraform"
    project_name = var.project_name
    environment = var.environment
    sg_name = "bastion"
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    common_tags = var.common_tags
    sg_tags = var.bastion_sg_tags
}

module "ansible_sg" {
    source = "../../sg-module-terraform"
    project_name = var.project_name
    environment = var.environment
    sg_name = "ansible"
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    common_tags = var.common_tags
    sg_tags = var.ansible_sg_tags
}