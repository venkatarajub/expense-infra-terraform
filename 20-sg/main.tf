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

# we are not mentionned ay ingress values in the module. To provide ingress values here we are writing sg rules
resource "aws_security_group_rule" "mysql-backend" {
    type = "ingress"
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    source_security_group_id = module.backend_sg.id 
    security_group_id = module.mysql_sg.id
}

resource "aws_security_group_rule" "backend-frotend" {
    type = "ingress"
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    source_security_group_id = module.frontend_sg.id 
    security_group_id = module.backend_sg.id 
}
resource "aws_security_group_rule" "frotend-public" {
    type = "ingress"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = module.backend_sg.id 
}

resource "aws_security_group_rule" "mysql-bastion" {
    type = "ingress"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    source_security_group_id = module.bastion_sg.id 
    security_group_id = module.mysql_sg.id
}

resource "aws_security_group_rule" "backend-bastion" {
    type = "ingress"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    source_security_group_id = module.bastion_sg.id 
    security_group_id = module.backend_sg.id 
}

resource "aws_security_group_rule" "frotend-bastion" {
    type = "ingress"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    source_security_group_id = module.bastion_sg.id 
    security_group_id = module.frontend_sg.id 
}

resource "aws_security_group_rule" "mysql-ansible" {
    type = "ingress"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    source_security_group_id = module.ansible_sg.id 
    security_group_id = module.mysql_sg.id
}

resource "aws_security_group_rule" "backend-ansible" {
    type = "ingress"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    source_security_group_id = module.ansible_sg.id 
    security_group_id = module.backend_sg.id 
}

resource "aws_security_group_rule" "frotend-ansible" {
    type = "ingress"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    source_security_group_id = module.ansible_sg.id 
    security_group_id = module.frontend_sg.id 
}

resource "aws_security_group_rule" "bastion-public" {
    type = "ingress"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = module.bastion_sg.id
}

resource "aws_security_group_rule" "ansible-public" {
    type = "ingress"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = module.ansible_sg.id
}