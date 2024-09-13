# terraform-aws-config

[![tflint](https://github.com/rhythmictech/terraform-aws-config/workflows/tflint/badge.svg?branch=master&event=push)](https://github.com/rhythmictech/terraform-aws-config/actions?query=workflow%3Atflint+event%3Apush+branch%3Amaster)
[![trivy](https://github.com/rhythmictech/terraform-aws-config/workflows/trivy/badge.svg?branch=master&event=push)](https://github.com/rhythmictech/terraform-aws-config/actions?query=workflow%3Atrivy+event%3Apush+branch%3Amaster)
[![yamllint](https://github.com/rhythmictech/terraform-aws-config/workflows/yamllint/badge.svg?branch=master&event=push)](https://github.com/rhythmictech/terraform-aws-config/actions?query=workflow%3Ayamllint+event%3Apush+branch%3Amaster)
[![misspell](https://github.com/rhythmictech/terraform-aws-config/workflows/misspell/badge.svg?branch=master&event=push)](https://github.com/rhythmictech/terraform-aws-config/actions?query=workflow%3Amisspell+event%3Apush+branch%3Amaster)
[![pre-commit-check](https://github.com/rhythmictech/terraform-aws-config/workflows/pre-commit-check/badge.svg?branch=master&event=push)](https://github.com/rhythmictech/terraform-aws-config/actions?query=workflow%3Apre-commit-check+event%3Apush+branch%3Amaster)
<a href="https://twitter.com/intent/follow?screen_name=RhythmicTech"><img src="https://img.shields.io/twitter/follow/RhythmicTech?style=social&logo=twitter" alt="follow on Twitter"></a>



<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.66.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_config_configuration_recorder.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_configuration_recorder) | resource |
| [aws_config_configuration_recorder_status.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_configuration_recorder_status) | resource |
| [aws_config_delivery_channel.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_delivery_channel) | resource |
| [aws_iam_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.awsconfig_managed_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_s3_bucket.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_logging.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_logging) | resource |
| [aws_s3_bucket_public_access_block.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_s3_bucket_versioning.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) | resource |
| [aws_sns_topic.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.assume](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_partition.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/partition) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | Name of the S3 bucket to record to (do not use with multi-region module) | `string` | `null` | no |
| <a name="input_bucket_suffix"></a> [bucket\_suffix](#input\_bucket\_suffix) | Suffix to append to S3 bucket name | `string` | `"awsconfig"` | no |
| <a name="input_create_sns_topic"></a> [create\_sns\_topic](#input\_create\_sns\_topic) | Whether to create an SNS topic | `bool` | `false` | no |
| <a name="input_delivery_channel_name"></a> [delivery\_channel\_name](#input\_delivery\_channel\_name) | Name of the delivery channel | `string` | `"awsconfig-s3"` | no |
| <a name="input_grant_s3_kms_access"></a> [grant\_s3\_kms\_access](#input\_grant\_s3\_kms\_access) | Whether to grant the IAM role access to the S3 bucket KMS key | `bool` | `true` | no |
| <a name="input_grant_sns_kms_access"></a> [grant\_sns\_kms\_access](#input\_grant\_sns\_kms\_access) | Whether to grant the IAM role access to the SNS topic KMS key | `bool` | `true` | no |
| <a name="input_logging_bucket"></a> [logging\_bucket](#input\_logging\_bucket) | Optional target for S3 access logging | `string` | `null` | no |
| <a name="input_logging_prefix"></a> [logging\_prefix](#input\_logging\_prefix) | Optional target prefix for S3 access logging (only used if `s3_access_logging_bucket` is set) | `string` | `null` | no |
| <a name="input_recorder_name"></a> [recorder\_name](#input\_recorder\_name) | Name of the config recorder | `string` | `"awsconfig"` | no |
| <a name="input_recording_group_all_supported"></a> [recording\_group\_all\_supported](#input\_recording\_group\_all\_supported) | Specifies whether AWS Config records configuration changes for every supported type of regional resource. If set to 'false', you must specify resource types in 'recording\_group\_resource\_types'. | `bool` | `true` | no |
| <a name="input_recording_group_exclusion_resource_types"></a> [recording\_group\_exclusion\_resource\_types](#input\_recording\_group\_exclusion\_resource\_types) | A list of resource types to exclude from recording. Only valid when 'recording\_group\_all\_supported' is true. | `list(string)` | `[]` | no |
| <a name="input_recording_group_include_global_resource_types"></a> [recording\_group\_include\_global\_resource\_types](#input\_recording\_group\_include\_global\_resource\_types) | Specifies whether AWS Config includes all supported types of global resources with the resources that it records. Only valid when 'recording\_group\_all\_supported' is true. | `bool` | `true` | no |
| <a name="input_recording_group_recording_strategy_use_only"></a> [recording\_group\_recording\_strategy\_use\_only](#input\_recording\_group\_recording\_strategy\_use\_only) | Specifies whether AWS Config limits recording to the resource types specified in 'recording\_group\_resource\_types'. Valid values: 'ALL\_SUPPORTED\_RESOURCE\_TYPES' or 'INCLUSION\_BY\_RESOURCE\_TYPES'. | `string` | `null` | no |
| <a name="input_recording_group_resource_types"></a> [recording\_group\_resource\_types](#input\_recording\_group\_resource\_types) | A list of valid AWS resource types to include in this recording group. Only used if 'recording\_group\_all\_supported' is false. | `list(string)` | `[]` | no |
| <a name="input_recording_mode_override_description"></a> [recording\_mode\_override\_description](#input\_recording\_mode\_override\_description) | A description for the recording mode override. | `string` | `null` | no |
| <a name="input_recording_mode_override_enabled"></a> [recording\_mode\_override\_enabled](#input\_recording\_mode\_override\_enabled) | Specifies whether to enable recording mode override. | `bool` | `false` | no |
| <a name="input_recording_mode_override_recording_frequency"></a> [recording\_mode\_override\_recording\_frequency](#input\_recording\_mode\_override\_recording\_frequency) | The frequency for the recording mode override. Valid values: CONTINUOUS, PERIODIC\_1\_HOUR, PERIODIC\_3\_HOURS, PERIODIC\_6\_HOURS, PERIODIC\_12\_HOURS, PERIODIC\_24\_HOURS | `string` | `"CONTINUOUS"` | no |
| <a name="input_recording_mode_override_resource_types"></a> [recording\_mode\_override\_resource\_types](#input\_recording\_mode\_override\_resource\_types) | A list of resource types to be recorded at the frequency specified in recording\_mode\_override\_recording\_frequency. | `list(string)` | `[]` | no |
| <a name="input_recording_mode_recording_frequency"></a> [recording\_mode\_recording\_frequency](#input\_recording\_mode\_recording\_frequency) | The frequency with which AWS Config records configuration changes. Valid values: CONTINUOUS, PERIODIC\_1\_HOUR, PERIODIC\_3\_HOURS, PERIODIC\_6\_HOURS, PERIODIC\_12\_HOURS, PERIODIC\_24\_HOURS | `string` | `"CONTINUOUS"` | no |
| <a name="input_s3_bucket_kms_key_id"></a> [s3\_bucket\_kms\_key\_id](#input\_s3\_bucket\_kms\_key\_id) | The ARN of the KMS key to use for encrypting the S3 bucket. If not provided, AES256 encryption will be used. | `string` | `null` | no |
| <a name="input_s3_key_prefix"></a> [s3\_key\_prefix](#input\_s3\_key\_prefix) | The prefix for the specified S3 bucket. | `string` | `null` | no |
| <a name="input_snapshot_delivery_frequency"></a> [snapshot\_delivery\_frequency](#input\_snapshot\_delivery\_frequency) | Delivery frequency. Valid values: One\_Hour, Three\_Hours, Six\_Hours, Twelve\_Hours, TwentyFour\_Hours | `string` | `"Six_Hours"` | no |
| <a name="input_sns_topic_arn"></a> [sns\_topic\_arn](#input\_sns\_topic\_arn) | SNS topic to deliver config rule notifications to | `string` | `null` | no |
| <a name="input_sns_topic_kms_key_id"></a> [sns\_topic\_kms\_key\_id](#input\_sns\_topic\_kms\_key\_id) | The ARN of the KMS key to use for encrypting the SNS topic. If not provided, the default AWS managed key for SNS will be used. | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to add to resources that support it | `map(string)` | `{}` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Additional Information

The SNS topic created by this module (when `sns_topic_arn` is not provided) will have a name prefix based on the `recorder_name` variable, followed by "-config-topic-". AWS will append a unique suffix to this prefix to ensure uniqueness.
