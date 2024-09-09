<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.64.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | 3.6.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.64.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.6.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_access_key.account-key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_access_key) | resource |
| [aws_iam_user.account](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user_policy.user-account-policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy) | resource |
| [random_pet.env](https://registry.terraform.io/providers/hashicorp/random/3.6.2/docs/resources/pet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_iam_user"></a> [aws\_iam\_user](#input\_aws\_iam\_user) | Name of the AWS IAM user to create | `string` | `""` | no |
| <a name="input_aws_iam_user_path"></a> [aws\_iam\_user\_path](#input\_aws\_iam\_user\_path) | Path to create the AWS IAM user in | `string` | `"/system"` | no |
| <a name="input_aws_iam_user_policy"></a> [aws\_iam\_user\_policy](#input\_aws\_iam\_user\_policy) | Configuration variables passed to the AWS IAM user policy resource | <pre>object({<br>    Version = optional(string, "2012-10-17")<br>    Statement = list(object({<br>      Effect   = optional(string)<br>      Action   = optional(list(string))<br>      Resource = optional(string)<br>    }))<br>  })</pre> | n/a | yes |
| <a name="input_aws_iam_user_policy_name"></a> [aws\_iam\_user\_policy\_name](#input\_aws\_iam\_user\_policy\_name) | Name of the IAM user policy to create | `string` | `""` | no |
| <a name="input_aws_iam_user_tags"></a> [aws\_iam\_user\_tags](#input\_aws\_iam\_user\_tags) | Map of tags to add to the AWS IAM resources | `map(any)` | `{}` | no |
| <a name="input_aws_kms_key_config"></a> [aws\_kms\_key\_config](#input\_aws\_kms\_key\_config) | Configuration variables passed to the AWS KMS key resource | <pre>object({<br>    description = optional(string)<br>    rotation    = optional(bool)<br>    deletion    = optional(number)<br>  })</pre> | `null` | no |
| <a name="input_aws_kms_key_create"></a> [aws\_kms\_key\_create](#input\_aws\_kms\_key\_create) | Whether to provision an AWS KMS key or not | `bool` | `true` | no |
| <a name="input_aws_kms_key_policy"></a> [aws\_kms\_key\_policy](#input\_aws\_kms\_key\_policy) | Configuration variables passed to the AWS KMS Key policy resource | <pre>object({<br>    Id = optional(string)<br>    Statement = optional(list(object({<br>      Action    = optional(string)<br>      Effect    = optional(string)<br>      Principal = optional(map(any))<br>      Resource  = optional(string)<br>      Sid       = optional(string)<br>    })))<br>    Version = optional(string)<br>  })</pre> | `null` | no |
| <a name="input_provider_aws"></a> [provider\_aws](#input\_provider\_aws) | Configuration passed to the Hashicorp/aws provider | <pre>object({<br>    region = optional(string)<br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_user"></a> [user](#output\_user) | Map with user-specific data for use in other modules |
<!-- END_TF_DOCS -->