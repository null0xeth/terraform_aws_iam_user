resource "random_pet" "env" {
  length    = 2
  separator = "_"
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


output "user" {
  description = "Map with user-specific data for use in other modules"
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
