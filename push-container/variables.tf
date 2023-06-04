variable "project" {
  type = string
}

variable "credentials_file" {}

variable "region" {
  type = string
}

variable "zone" {
  type = string
}

variable "image_name" {
  default = "hello-shiny"
}
