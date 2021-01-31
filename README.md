# terraform-aws-config

[![](https://github.com/rhythmictech/terraform-aws-config/workflows/check/badge.svg)](https://github.com/rhythmictech/terraform-aws-config/actions)


<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13.4 |
| aws | >= 3.8 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 3.8 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| bucket\_name | Name of the S3 bucket to record to (do not use with multi-region module) | `string` | `null` | no |
| bucket\_suffix | Suffix to append to S3 bucket name | `string` | `"awsconfig"` | no |
| delivery\_channel\_name | Name of the delivery channel | `string` | `"awsconfig-s3"` | no |
| enable\_global\_logging | Enable recording of global events (E.g., IAM) | `bool` | `true` | no |
| logging\_bucket | Optional target for S3 access logging | `string` | `null` | no |
| logging\_prefix | Optional target prefix for S3 access logging (only used if `s3_access_logging_bucket` is set) | `string` | `null` | no |
| recorder\_name | Name of the config recorder | `string` | `"awsconfig"` | no |
| snapshot\_delivery\_frequency | Deliery frequency: One\_Hour, Three\_Hours, Six\_Hours, Twelve\_Hours, TwentyFour\_Hours | `string` | `"Six_Hours"` | no |
| sns\_topic\_arn | SNS topic to deliver config rule notifications to | `string` | `null` | no |
| tags | Tags to add to resources that support it | `map(string)` | `{}` | no |

## Outputs

No output.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
