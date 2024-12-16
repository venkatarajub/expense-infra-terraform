variable "project_name" {
    default = "expense"
}

variable "environment" {
    default = "dev"
}

variable "mysql_sg_tags" {
    default = {
        Component = "mysql"
    }
}
variable "common_tags" {
    default = {
        project = "expense"
        terraform = true
    }
}

variable "backend_sg_tags" {
    default = {
        Component = "backend"
    }
}

variable "frontend_sg_tags" {
    default = {
        Component = "frontend"
    }
}

variable "bastion_sg_tags" {
    default = {
        Component = "bastion"
    }
}

variable "ansible_sg_tags" {
    default = {
        Component = "ansible"
    }
}