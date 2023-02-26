
variable "ami-id" {
  type    = string
  default = "ami-0f8ca728008ff5af4"
}

output "ami-answer" {
  value = var.ami-id
}

variable "my-db-name" {
  type    = string
  default = "MyNewRDSdbRohan987"
}

variable "my-db-engine" {
  type    = string
  default = "mysql"
}

variable "my-db-engine-number" {
  type    = number
  default = 5.7
}

variable "my-db-user" {
  type    = string
  default = "foo"
}

variable "my-db-pwd" {
  type    = string
  default = "fameerfood69"
}
