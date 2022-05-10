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

variable "enable_global_logging" {
  default     = true
  description = "Enable recording of global events (E.g., IAM)"
  type        = bool
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
  default     = "Six_Hours"
  description = "Deliery frequency: One_Hour, Three_Hours, Six_Hours, Twelve_Hours, TwentyFour_Hours"
  type        = string
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
