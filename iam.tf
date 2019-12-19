data "aws_iam_policy_document" "awsconfig_policy_doc" {
  statement {
    effect  = "Allow"
    actions = ["s3:PutObject"]
    resources = [
      "${aws_s3_bucket.awsconfig_bucket.arn}/*",
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
      aws_s3_bucket.awsconfig_bucket.arn,
    ]
  }
}

resource "aws_iam_policy" "awsconfig_policy" {
  name_prefix = "awsconfig-"
  policy      = data.aws_iam_policy_document.awsconfig_policy_doc.json
}

data "aws_iam_policy_document" "awsconfig_assume_policy" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["config.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "awsconfig_role" {
  name_prefix        = "aws-config-role"
  assume_role_policy = data.aws_iam_policy_document.awsconfig_assume_policy.json
}

resource "aws_iam_role_policy_attachment" "awsconfig-attach-awsconfig-policy" {
  role       = aws_iam_role.awsconfig_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSConfigRole"
}

resource "aws_iam_role_policy_attachment" "awsconfig-attach-localconfig-policy" {
  role       = aws_iam_role.awsconfig_role.name
  policy_arn = aws_iam_policy.awsconfig_policy.arn
}

