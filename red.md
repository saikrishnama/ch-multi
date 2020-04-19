AWS Cloudwatch Terraform module
Terraform module which creates Cloudwatch resources on AWS.

This type of resources are supported:

Cloudwatch Dashboard
Cloudwatch Event Permission
Cloudwatch Event Rule
Cloudwatch Event Target
Cloudwatch Log Destination
Cloudwatch Log Destination Policy
Cloudwatch Log Group
Log metric filter
Cloudwatch Log Resource Policy
Cloudwatch Log Stream
Cloudwatch Log Subscription Filter
Metric alarm
Terraform versions
Only Terraform 0.12 is supported.

Inputs
Name	Description	Type	Default	Required
aws_region	A Flag to provide aws_region	string	us-east-1	yes
shared_tags	Additional tags (e.g. map(Environmenr,map)	map	<map>	no
enable_aws_cloudwatch_group	A Flag to Control Creation of aws_cloudwatch_log_group	string	true	yes
name	The name of the log group	string	test	yes
kms_key_id	The ARN of the KMS Key to use when encrypting log data. Please note, after the AWS KMS CMK is disassociated from the log group, AWS CloudWatch Logs stops encrypting newly ingested data for the log group. All previously ingested data remains encrypted, and AWS CloudWatch Logs requires permissions for the CMK whenever the encrypted data is requested.	string	``	no
retention_in_days	Number of days you want to retain log events in the log group	string	30	no
enable_logstream	A Flag to Control Creation of enable_logstream	bool	true	yes
stream_names	Names of streams	list	<list>	no
enable_aws_cloudwatch_alaram	A flag to Control Creation of enable_aws_cloudwatch_alaram	bool	true	yes
alarm_name	The descriptive name for the alarm. This name must be unique within the user’s AWS account.	string	-	yes
comparison_operator	The arithmetic operation to use when comparing the specified Statistic and Threshold. The specified Statistic value is used as the first operand. Either of the following is supported: GreaterThanOrEqualToThreshold, GreaterThanThreshold, LessThanThreshold, LessThanOrEqualToThreshold.	string	-	yes
evaluation_periods	The number of periods over which data is compared to the specified threshold	number	60	yes
metric_name	The name for the alarm’s associated metric	string	-	yes
namespace	The namespace for the alarm’s associated metric	string	-	yes
period	The period in seconds over which the specified statistic is applied	string	-	yes
statistic	The statistic to apply to the alarm’s associated metric	string	-	yes
threshold	The value against which the specified statistic is compared.	number	-	yes
actions_enabled	Indicates whether or not actions should be executed during any changes to the alarm’s state	bool	-	yes
alarm_description	The description for the alarm	string	Log errors are too high	yes
dimensions	The dimensions for the alarm’s associated metric.	any	-	yes
alarm_actions	The list of actions to execute when this alarm transitions into an ALARM state from any other state. Each action is specified as an Amazon Resource Name (ARN).	list(string)	-	no
insufficient_data_actions	The list of actions to execute when this alarm transitions into an INSUFFICIENT_DATA state from any other state. Each action is specified as an Amazon Resource Name (ARN)	list(string)	-	no
ok_actions	The list of actions to execute when this alarm transitions into an OK state from any other state. Each action is specified as an Amazon Resource Name (ARN).	list(string)	-	no
enable_aws_cloudwatch_log_metric_filter	A Flag to Control Creation of enable_aws_cloudwatch_log_metric_filter	bool	-	yes
cloudwatch_group_metric_filter_name	A name for the metric filter	string	-	yes
log_metric_filter_pattern	A valid CloudWatch Logs filter pattern for extracting metric data out of ingested log events	string	-	yes
metric_transformation_name	The name of the CloudWatch metric to which the monitored log information should be published	string	-	yes
metric_transformation_namespace	The destination namespace of the CloudWatch metric	string	-	no
metric_transformation_value	What to publish to the metric	number	1	no
metric_transformation_value	The value to emit when a filter pattern does not match a log event	number	0	no
enable_aws_cloudwatch_event_schedule_rule	A Flag to Control Creation of enable_aws_cloudwatch_event_schedule_rule	bool	true	yes
aws_cloudwatch_event_rule_name	Name of the event rule	string	test-event-rule	no
schedule_expression	Schedule expression of the event if event pattern is not defined	string	``	yes
event_pattern	Event pattern described a JSON object,Required when schedule expression is not definied	string	``	yes
description	description for Rules	string	``	no
enable_aws_cloudwatch_event_target	A Flag to Control Creation of enable_aws_cloudwatch_event_schedule_rule	bool	``	yes
target_id	The ID of the target like SNS,Lambda	string	``	no
target_arn	The ARN of the target	string	``	no
enable_aws_cloudwatch_event_permission	A flag to Control Creation of enable_aws_cloudwatch_event_schedule_rule	bool	``	no
statement_id	An identifier string for the external account that you are granting permissions to.	string	``	yes
aws_account_statement_id	the 12-digit AWS account ID that you are permitting to put events to your default event bus	string	``	yes
enable_aws_cloudwatch_log_destination	A flag to Control Creation of enable_aws_cloudwatch_event_schedule_rule	bool	``	no
aws_cloudwatch_log_destination	log destination name	string	``	no
aws_cloudwatch_log_destination_iam_role_arn	IAM role arn value	string	``	no
destination_target_arn	destination arn value	string	``	no
enable_aws_cloudwatch_log_destination_policy	A flag to Control Creation of enable_aws_cloudwatch_log_destination_policy	bool	``	no
policy_name	the policy name	string	``	no
access_policy	the access policy	string	``	no
enable_aws_cloudwatch_log_subscription_filter	A flag to Control Creation of enable_aws_cloudwatch_log_subscription_filter	bool	``	no
subscription_filter_name	A name for the subscription filter	string	``	no
aws_cloudwatch_log_destination_arn	The ARN of the destination to deliver matching log events to	string	``	no
flow_log_filter_patern	A valid CloudWatch Logs filter pattern for subscribing to a filtered stream of log event	string	``	no
aws_cloudwatch_log_group_name	The name of the log group to associate the subscription filter with	string	``	no
enable_aws_cloudwatch_dashboard	Whether to create the Cloudwatch dashboard	bool	``	no
dashboard_name	Name of the dashboard	string	``	no
dashboard_body	The detailed information about the dashboard, including what widgets are included and their location on the dashboard.	string	``	no
enable_aws_cloudwatch_log_resource_policy	A flag to Control Creation of enable_aws_cloudwatch_log_resource_policy	bool	false	no
policy_document	The log resource policy document	string	``	no
resource_policy_name	the name for the resouce policy	string	``	no
Outputs
Name	Description
log_group_name	Name of log group
log_group_arn	ARN of the log group
stream_arns	ARN of the log stream
Usage
Sample Main.tf file
provider "aws" {
  region     = "us-east-1"
  access_key = "***"
  secret_key = "***"
}

module "cloud-watch" {
  source = "../terraform-cloud-watch"
  enable_aws_cloudwatch_group = true
  name = "log-group-test"
  kms_key_id = null
  retention_in_days = 60
  
  enable_logstream = true
  stream_names = "log-stream-test"
  
  enable_aws_cloudwatch_alaram = true
  alarm_name = "alarm-test"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods = 1
  metric_name = "ErrorCount"
  namespace = "AWS/ELB"
  period = "60"
  statistic = "Sum"
  threshold = 10
  actions_enabled = true
  #alarm_actions = "arn:aws:sns:us-east-1:****:aws_sns_topic_name"
  alarm_description = "Log errors are too high"
  dimensions = {
    LoadBalancerName = "arn:aws:elasticloadbalancing:us-east-1:****:loadbalancer/app/test/d2af63740ad29f5f"
  }
  insufficient_data_actions = null 
  ok_actions = null 

  enable_aws_cloudwatch_log_metric_filter = true
  cloudwatch_group_metric_filter_name = "metric-test"
  log_metric_filter_pattern = "ERROR"
  metric_transformation_name = "test-metric-transformation"
  metric_transformation_namespace = "mynamespace"
  metric_transformation_value = 1
  metric_transformation_default_value = 0
  
  enable_aws_cloudwatch_event_schedule_rule  = true
  aws_cloudwatch_event_rule_name  = "test-event-rule"
  schedule_expression  = null # "cron(0 6 * * ? *)"
  event_pattern =  var.event_pattern
  description = "A sample Test Event Rule"

  enable_aws_cloudwatch_event_target = true
  target_id = "snsid"
  target_arn = "arn:aws:sns:us-east-1:****:aws_sns_topic_name"

  enable_aws_cloudwatch_event_permission = true
  statement_id = "test"
  aws_account_statement_id = "**"
  
  enable_aws_cloudwatch_log_destination = false
  aws_cloudwatch_log_destination = "log-destination"
  aws_cloudwatch_log_destination_iam_role_arn = "arn:aws:iam::****:role/Cloudwatch"
  destination_target_arn= null 

  enable_aws_cloudwatch_log_destination_policy = false 
  policy_name = null
  access_policy = null
 
  enable_aws_cloudwatch_log_subscription_filter = false
  subscription_filter_name = null
  aws_cloudwatch_log_destination_arn = null
  flow_log_filter_patern = null
  aws_cloudwatch_log_group_name = null 
  
  enable_aws_cloudwatch_dashboard = false
  dashboard_name = null
  dashboard_body = null

  enable_aws_cloudwatch_log_resource_policy = false
  policy_document = null
  resource_policy_name = null
}

Markdown selection 11190 bytes 1549 words 185 lines Ln 186, Col 0HTML 8019 characters 1156 words 396 paragraphs
