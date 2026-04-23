variable "instances" {
    default = ["mysql", "backend", "frontend"]
}

variable "zone_id" {
    default = "Z019397128IK8C6UA6GBR"
}

variable "domain_name" {
    default = "cloudwithravi.xyz"
}

variable "common_tags" {
    type = map
    default = {
        Project = "expense"
        Environment = "dev"
    }
}