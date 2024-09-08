resource "random_pet" "env" {
  length    = 2
  separator = "_"
}

##### AWS KMS KEY #################################################
resource "aws_kms_key" "new_key" {
  count                   = (var.aws_kms_key_create ? 1 : 0)
  description             = var.aws_kms_key_config.description
  enable_key_rotation     = var.aws_kms_key_config.rotation
  deletion_window_in_days = var.aws_kms_key_config.deletion
}

resource "aws_kms_key_policy" "vault_unseal" {
  count  = (var.aws_kms_key_create ? 1 : 0)
  key_id = element(aws_kms_key.new_key[*], 0).id #aws_kms_key.vault_unseal.id
  policy = jsonencode(var.aws_kms_key_policy)
}

##### AWS IAM USER #################################################
resource "aws_iam_user" "account" {
  name          = "${var.aws_iam_user}-${random_pet.env.id}"
  path          = var.aws_iam_user_path
  force_destroy = true
  tags          = var.aws_iam_user_tags
}

resource "aws_iam_access_key" "account-key" {
  user   = aws_iam_user.account.name
  status = "Active"
}

resource "aws_iam_user_policy" "user-account-policy" {
  name   = "${var.aws_iam_user_policy_name}-${random_pet.env.id}"
  user   = aws_iam_user.account.name
  policy = jsonencode(var.aws_iam_user_policy) #data.aws_iam_policy_document.account-policy.json
}

output "kms" {
  value = zipmap(
    [
      "kms_key_arn",
      "kms_key_id",
    ],
    [
      element(aws_kms_key.new_key[*], 0).arn,
      element(aws_kms_key.new_key[*], 0).key_id,
    ]
  )
}

output "user" {
  value = zipmap(
    [
      "user_arn",
      "user_id",
      "user_name",
      "user_policy_id",
      "user_policy_name",
      "key_id",
      "key_secret",
    ],
    [
      aws_iam_user.account.arn,
      aws_iam_user.account.id,
      aws_iam_user.account.name,
      aws_iam_user_policy.user-account-policy.id,
      aws_iam_user_policy.user-account-policy.name,
      aws_iam_access_key.account-key.id,
      aws_iam_access_key.account-key.secret,
    ]
  )
}
