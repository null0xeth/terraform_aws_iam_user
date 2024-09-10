variable "provider_aws" {
  description = "Configuration passed to the Hashicorp/aws provider"
  type = object({
    region = optional(string)
  })
}

variable "aws_kms_key_create" {
  type        = bool
  default     = true
  description = "Whether to provision an AWS KMS key or not"
}

variable "aws_kms_key_config" {
  description = "Configuration variables passed to the AWS KMS key resource"
  type = object({
    description = optional(string)
    rotation    = optional(bool)
    deletion    = optional(number)
  })
  default = null
}

variable "aws_kms_key_policy" {
  description = "Configuration variables passed to the AWS KMS Key policy resource"
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

variable "aws_iam_user" {
  default     = ""
  type        = string
  description = "Name of the AWS IAM user to create"
}

variable "aws_iam_user_path" {
  type        = string
  description = "Path to create the AWS IAM user in"
  default     = "/system"
}

variable "aws_iam_user_tags" {
  type        = map(any)
  description = "Map of tags to add to the AWS IAM resources"
  default     = {}
}

variable "aws_iam_user_policy_name" {
  type        = string
  description = "Name of the IAM user policy to create"
  default     = ""
}

variable "aws_iam_user_policy" {
  description = "Configuration variables passed to the AWS IAM user policy resource"
  type = object({
    Version = optional(string, "2012-10-17")
    Statement = list(object({
      Effect   = optional(string)
      Action   = optional(list(string))
      Resource = optional(string)
    }))
  })
}

