module "vpc" {
    source = "../../vpc-module-terraform"
    project = var.project
    environment = var.environment
    public_cidrs = var.public_cidrs
    private_cidrs = var.private_cidrs
    database_cidrs = var.database_cidrs
    is_peering_required = true

}