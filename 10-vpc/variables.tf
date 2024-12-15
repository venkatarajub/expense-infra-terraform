variable "public_cidrs" {
    type = list
    default  = ["10.0.1.0/24", "10.0.11.0/24"]
}

variable "private_cidrs" {
    type = list
    default  = ["10.0.2.0/24", "10.0.22.0/24"]
}

variable "database_cidrs" {
    type = list
    default  = ["10.0.3.0/24", "10.0.33.0/24"]
}

variable "project" {
    default  = "expense"
}

variable "environment" {
    default = "dev"
}