variable "ami" {
  default = "ami-08c40ec9ead489470"
  type    = string
}

variable "instance_type"{

}

variable "key" {
  default = "virginia"
  type    = string
}

variable "instance_count" {
  description = "EC2 instance count"
  type        = number
  default     = 1
}

variable "enable_public_ip" {
  description = "Enable public IP address"
  type        = bool
  default     = true
}

variable "user_names" {
  description = "IAM usernames"
  type        = list(string)
  default     = ["dev1", "dev2", "dev3"]
}

variable "project_environment" {
  description = "project name and environment"
  type        = map(string)
  default     = {
    project     = "project5",
    environment = "dev"
  }
}

variable "token-value" {
  default   = "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"
  type = string
}

