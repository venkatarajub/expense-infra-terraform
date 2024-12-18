variable "project_name" {
  default = "expense"
}

variable "environment" {
  default = "dev"
}

variable "common_tags" {
  default = {
    project   = "expence"
    terraform = true
  }
}

variable "zone_name" {
    default = "vensa.online"
}