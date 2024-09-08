variable "provider_aws" {}
variable "aws_kms_key_create" { default = true }

variable "aws_kms_key_config" {
  type = object({
    description = optional(string)
    rotation    = optional(bool)
    deletion    = optional(number)
  })
  default = null
}

variable "aws_kms_key_policy" {
  type = object({
    Id = optional(string)
    Statement = optional(list(object({
      Action    = optional(string)
      Effect    = optional(string)
      Principal = optional(map(any))
      Resource  = optional(string)
      Sid       = optional(string)
    })))
    Version = optional(string)
  })
  default = null
}

variable "aws_iam_user" { default = "terrahonker" }
variable "aws_iam_user_path" { default = "/system" }
variable "aws_iam_user_tags" { default = {} }
variable "aws_iam_user_policy_name" { default = "" }

variable "aws_iam_user_policy" {
  type = object({
    Version = optional(string, "2012-10-17")
    Statement = list(object({
      Effect   = optional(string)
      Action   = optional(list(string))
      Resource = optional(string)
    }))
  })
}

