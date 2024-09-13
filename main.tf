data "aws_caller_identity" "current" {
}

data "aws_partition" "current" {
}

data "aws_region" "current" {
}

locals {
  account_id  = data.aws_caller_identity.current.account_id
  bucket_name = var.bucket_name == null ? "${local.account_id}-${local.region}-${var.bucket_suffix}" : var.bucket_name
  partition   = data.aws_partition.current.partition
  region      = data.aws_region.current.name
}

#trivy:ignore:AVD-AWS-0089
resource "aws_s3_bucket" "this" {
  bucket = local.bucket_name
  tags = merge(var.tags, {
    "Name" = local.bucket_name
  })
}

resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_logging" "this" {
  count         = var.logging_bucket != null ? 1 : 0
  bucket        = aws_s3_bucket.this.id
  target_bucket = var.logging_bucket
  target_prefix = var.logging_prefix == null ? local.bucket_name : var.logging_prefix
}

resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  bucket = aws_s3_bucket.this.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = var.s3_bucket_kms_key_id != null ? "aws:kms" : "AES256"
      kms_master_key_id = var.s3_bucket_kms_key_id
    }
  }
}

resource "aws_s3_bucket_public_access_block" "this" {
  bucket                  = aws_s3_bucket.this.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_config_configuration_recorder" "this" {
  name     = var.recorder_name
  role_arn = aws_iam_role.this.arn

  recording_group {
    all_supported                 = var.recording_group_all_supported
    include_global_resource_types = var.recording_group_include_global_resource_types
    resource_types                = var.recording_group_resource_types
    exclusion_by_resource_types {
      resource_types = var.recording_group_exclusion_resource_types
    }
    recording_strategy {
      use_only = var.recording_group_recording_strategy_use_only
    }
  }

  recording_mode {
    recording_frequency = var.recording_mode_recording_frequency

    dynamic "recording_mode_override" {
      for_each = var.recording_mode_override_enabled ? [1] : []
      content {
        description         = var.recording_mode_override_description
        resource_types      = var.recording_mode_override_resource_types
        recording_frequency = var.recording_mode_override_recording_frequency
      }
    }
  }
}

resource "aws_sns_topic" "this" {
  count       = var.create_sns_topic ? 1 : 0
  name_prefix = "${var.recorder_name}-config-topic-"

  kms_master_key_id = var.sns_topic_kms_key_id
}

resource "aws_config_delivery_channel" "this" {
  name           = var.delivery_channel_name
  s3_bucket_name = aws_s3_bucket.this.bucket
  s3_key_prefix  = var.s3_key_prefix
  sns_topic_arn  = var.create_sns_topic ? aws_sns_topic.this[0].arn : var.sns_topic_arn

  snapshot_delivery_properties {
    delivery_frequency = var.snapshot_delivery_frequency
  }

  s3_kms_key_arn = var.s3_bucket_kms_key_id

  depends_on = [aws_config_configuration_recorder.this]
}

resource "aws_config_configuration_recorder_status" "this" {
  name       = var.recorder_name
  is_enabled = true

  depends_on = [aws_config_delivery_channel.this]
}
