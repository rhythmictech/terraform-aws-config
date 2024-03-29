
#tfsec:ignore:aws-iam-no-policy-wildcards
data "aws_iam_policy_document" "this" {
  statement {
    effect  = "Allow"
    actions = ["s3:PutObject"]
    resources = [
      "${aws_s3_bucket.this.arn}/*",
    ]
    condition {
      test     = "StringEquals"
      variable = "s3:x-amz-acl"
      values   = ["bucket-owner-full-control"]
    }
  }
  statement {
    effect  = "Allow"
    actions = ["s3:GetBucketAcl"]
    resources = [
      aws_s3_bucket.this.arn,
    ]
  }
}

resource "aws_iam_policy" "this" {
  name_prefix = "awsconfig-${local.region}"
  policy      = data.aws_iam_policy_document.this.json
}

data "aws_iam_policy_document" "assume" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["config.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "this" {
  name_prefix        = "aws-config-role-${local.region}"
  assume_role_policy = data.aws_iam_policy_document.assume.json
  tags               = var.tags
}

resource "aws_iam_role_policy_attachment" "awsconfig_managed_policy" {
  role       = aws_iam_role.this.name
  policy_arn = "arn:${local.partition}:iam::aws:policy/service-role/AWS_ConfigRole"
}


resource "aws_iam_role_policy_attachment" "this" {
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.this.arn
}
