########################################
# General Vars
########################################

variable "bucket_name" {
  default     = null
  description = "Name of the S3 bucket to record to (do not use with multi-region module)"
  type        = string
}

variable "bucket_suffix" {
  default     = "awsconfig"
  description = "Suffix to append to S3 bucket name"
  type        = string
}

variable "delivery_channel_name" {
  default     = "awsconfig-s3"
  description = "Name of the delivery channel"
  type        = string
}

variable "logging_bucket" {
  default     = null
  description = "Optional target for S3 access logging"
  type        = string
}

variable "logging_prefix" {
  default     = null
  description = "Optional target prefix for S3 access logging (only used if `s3_access_logging_bucket` is set)"
  type        = string
}

variable "recorder_name" {
  default     = "awsconfig"
  description = "Name of the config recorder"
  type        = string
}

variable "snapshot_delivery_frequency" {
  description = "Delivery frequency. Valid values: One_Hour, Three_Hours, Six_Hours, Twelve_Hours, TwentyFour_Hours"
  type        = string
  default     = "Six_Hours"
}

variable "sns_topic_arn" {
  default     = null
  description = "SNS topic to deliver config rule notifications to"
  type        = string
}

variable "tags" {
  default     = {}
  description = "Tags to add to resources that support it"
  type        = map(string)
}

variable "s3_bucket_kms_key_id" {
  description = "The ARN of the KMS key to use for encrypting the S3 bucket. If not provided, AES256 encryption will be used."
  type        = string
  default     = null
}

variable "sns_topic_kms_key_id" {
  description = "The ARN of the KMS key to use for encrypting the SNS topic. If not provided, the default AWS managed key for SNS will be used."
  type        = string
  default     = null
}

variable "recording_group_all_supported" {
  description = "Specifies whether AWS Config records configuration changes for every supported type of regional resource. If set to 'false', you must specify resource types in 'recording_group_resource_types'."
  type        = bool
  default     = true
}

variable "recording_group_include_global_resource_types" {
  description = "Specifies whether AWS Config includes all supported types of global resources with the resources that it records. Only valid when 'recording_group_all_supported' is true."
  type        = bool
  default     = true
}

variable "recording_group_resource_types" {
  description = "A list of valid AWS resource types to include in this recording group. Only used if 'recording_group_all_supported' is false."
  type        = list(string)
  default     = []
}

variable "recording_group_exclusion_resource_types" {
  description = "A list of resource types to exclude from recording. Only valid when 'recording_group_all_supported' is true."
  type        = list(string)
  default     = []
}

variable "recording_group_recording_strategy_use_only" {
  description = "Specifies whether AWS Config limits recording to the resource types specified in 'recording_group_resource_types'. Valid values: 'ALL_SUPPORTED_RESOURCE_TYPES' or 'INCLUSION_BY_RESOURCE_TYPES'."
  type        = string
  default     = null
}

variable "recording_mode_recording_frequency" {
  description = "The frequency with which AWS Config records configuration changes. Valid values: CONTINUOUS, PERIODIC_1_HOUR, PERIODIC_3_HOURS, PERIODIC_6_HOURS, PERIODIC_12_HOURS, PERIODIC_24_HOURS"
  type        = string
  default     = "CONTINUOUS"
}

variable "recording_mode_override_enabled" {
  description = "Specifies whether to enable recording mode override."
  type        = bool
  default     = false
}

variable "recording_mode_override_description" {
  description = "A description for the recording mode override."
  type        = string
  default     = null
}

variable "recording_mode_override_resource_types" {
  description = "A list of resource types to be recorded at the frequency specified in recording_mode_override_recording_frequency."
  type        = list(string)
  default     = []
}

variable "recording_mode_override_recording_frequency" {
  description = "The frequency for the recording mode override. Valid values: CONTINUOUS, PERIODIC_1_HOUR, PERIODIC_3_HOURS, PERIODIC_6_HOURS, PERIODIC_12_HOURS, PERIODIC_24_HOURS"
  type        = string
  default     = "CONTINUOUS"
}

variable "s3_key_prefix" {
  description = "The prefix for the specified S3 bucket."
  type        = string
  default     = null
}

variable "grant_s3_kms_access" {
  description = "Whether to grant the IAM role access to the S3 bucket KMS key"
  type        = bool
  default     = true
}

variable "grant_sns_kms_access" {
  description = "Whether to grant the IAM role access to the SNS topic KMS key"
  type        = bool
  default     = true
}

variable "create_sns_topic" {
  description = "Whether to create an SNS topic"
  type        = bool
  default     = false
}
