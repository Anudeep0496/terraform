variable "instance_type" {
  default     = "t3.micro"
  type        = string
  description = "type of instance"
}

variable "project" {
  default = "expense"
}

variable "component" {
  default = "backend"
}

variable "environment" {
  default = "dev"
}
