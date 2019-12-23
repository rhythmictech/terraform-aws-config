# terraform-aws-config

[![](https://github.com/rhythmictech/terraform-aws-config/workflows/check/badge.svg)](https://github.com/rhythmictech/terraform-aws-config/actions)


<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| bucket\_prefix |  | string | `"awsconfig"` | no |
| config\_regions |  | list | `[ "us-east-1", "us-east-2", "us-west-1", "us-west-2", "ca-central-1", "eu-central-1", "eu-west-1", "eu-west-2", "eu-west-3", "ap-northeast-1", "ap-northeast-2", "ap-southeast-1", "ap-southeast-2", "ap-south-1", "sa-east-1" ]` | no |
| logging\_bucket |  | string | n/a | yes |
| region |  | string | n/a | yes |
| snapshot\_delivery\_frequency | Deliery frequency: One_Hour, Three_Hours, Six_Hours, Twelve_Hours, TwentyFour_Hours | string | `"Six_Hours"` | no |
| tags |  | map(string) | n/a | yes |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
