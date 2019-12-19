variable "region" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "logging_bucket" {
  type = string
}

variable "bucket_prefix" {
  type    = string
  default = "awsconfig"
}

variable "snapshot_delivery_frequency" {
  type        = string
  description = "Deliery frequency: One_Hour, Three_Hours, Six_Hours, Twelve_Hours, TwentyFour_Hours"
  default     = "Six_Hours"
}

variable "config_regions" {
  default = [
    "us-east-1",
    "us-east-2",
    "us-west-1",
    "us-west-2",
    "ca-central-1",
    "eu-central-1",
    "eu-west-1",
    "eu-west-2",
    "eu-west-3",
    "ap-northeast-1",
    "ap-northeast-2",
    "ap-southeast-1",
    "ap-southeast-2",
    "ap-south-1",
    "sa-east-1",
  ]
}

