variable "alarm_summary" {
  description = "(Optional) (Updatable) Customizable alarm summary (`alarmSummary` [alarm message parameter](https://docs.cloud.oracle.com/iaas/Content/Monitoring/alarm-message-format.htm)). Optionally include [dynamic variables](https://docs.cloud.oracle.com/iaas/Content/Monitoring/Tasks/update-alarm-dynamic-variables.htm). The alarm summary appears within the body of the alarm message and in responses to  [ListAlarmStatus](https://docs.cloud.oracle.com/iaas/api/#/en/monitoring/latest/AlarmStatusSummary/ListAlarmsStatus)  [GetAlarmHistory](https://docs.cloud.oracle.com/iaas/api/#/en/monitoring/latest/AlarmHistoryCollection/GetAlarmHistory) and [RetrieveDimensionStates](https://docs.cloud.oracle.com/iaas/api/#/en/monitoring/latest/AlarmDimensionStatesCollection/RetrieveDimensionStates)."
  type        = string
  default     = null
}

variable "body" {
  description = "(Optional) (Updatable) The human-readable content of the delivered alarm notification. Optionally include [dynamic variables](https://docs.cloud.oracle.com/iaas/Content/Monitoring/Tasks/update-alarm-dynamic-variables.htm). Oracle recommends providing guidance to operators for resolving the alarm condition. Consider adding links to standard runbook practices. Avoid entering confidential information.  Example: `High CPU usage alert. Follow runbook instructions for resolution.`"
  type        = string
  default     = null
}

variable "compartment_id" {
  description = "(Required) (Updatable) The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment containing the alarm."
  type        = string
}

variable "defined_tags" {
  description = "(Optional) (Updatable) Usage of predefined tag keys. These predefined keys are scoped to namespaces. Example: `{\"Operations.CostCenter\": \"42\"}`"
  type        = map(string)
  default     = null
}

variable "destinations" {
  description = "(Required) (Updatable) A list of destinations for alarm notifications. Each destination is represented by the [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of a related resource, such as a [topic](https://docs.cloud.oracle.com/iaas/api/#/en/notification/latest/NotificationTopic). Supported destination services: Notifications, Streaming. Limit: One destination per supported destination service."
  type        = list(string)
}

variable "display_name" {
  description = "(Required) (Updatable) A user-friendly name for the alarm. It does not have to be unique, and it's changeable. Avoid entering confidential information.\n\nThis value determines the title of each alarm notification.\n\nExample: `High CPU Utilization`"
  type        = string
}

variable "evaluation_slack_duration" {
  description = "(Optional) (Updatable) Customizable slack period to wait for metric ingestion before evaluating the alarm. Specify a string in ISO 8601 format (`PT10M` for ten minutes or `PT1H` for one hour). Minimum: PT3M. Maximum: PT2H. Default: PT3M. For more information about the slack period, see [About the Internal Reset Period](https://docs.cloud.oracle.com/iaas/Content/Monitoring/Concepts/monitoringoverview.htm#reset)."
  type        = string
  default     = null
}

variable "freeform_tags" {
  description = "(Optional) (Updatable) Simple key-value pair that is applied without any predefined name, type or scope. Exists for cross-compatibility only. Example: `{\"Department\": \"Finance\"}`"
  type        = map(string)
  default     = {}
}

variable "is_enabled" {
  description = "(Required) (Updatable) Whether the alarm is enabled.  Example: `true`"
  type        = bool
}

variable "is_notifications_per_metric_dimension_enabled" {
  description = "(Optional) (Updatable) When set to `true`, splits alarm notifications per metric stream. When set to `false`, groups alarm notifications across metric streams. Example: `true`"
  type        = bool
  default     = null
}

variable "message_format" {
  description = "(Optional) (Updatable) The format to use for alarm notifications."
  type        = string
  default     = null
}

variable "metric_compartment_id" {
  description = "(Required) (Updatable) The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment containing the metric being evaluated by the alarm."
  type        = string
}

variable "metric_compartment_id_in_subtree" {
  description = "(Optional) (Updatable) When true, the alarm evaluates metrics from all compartments and subcompartments. The parameter can only be set to true when metricCompartmentId is the tenancy OCID (the tenancy is the root compartment). A true value requires the user to have tenancy-level permissions. If this requirement is not met, then the call is rejected. When false, the alarm evaluates metrics from only the compartment specified in metricCompartmentId. Default is false.  Example: `true`"
  type        = bool
  default     = null
}

variable "namespace" {
  description = "(Required) (Updatable) The source service or application emitting the metric that is evaluated by the alarm.  Example: `oci_computeagent`"
  type        = string
}

variable "notification_title" {
  description = "(Optional) (Updatable) Customizable notification title (`title` [alarm message parameter](https://docs.cloud.oracle.com/iaas/Content/Monitoring/alarm-message-format.htm)). Optionally include [dynamic variables](https://docs.cloud.oracle.com/iaas/Content/Monitoring/Tasks/update-alarm-dynamic-variables.htm). The notification title appears as the subject line in a formatted email message and as the title in a Slack message."
  type        = string
  default     = null
}

variable "notification_version" {
  description = "(Optional) (Updatable) The version of the alarm notification to be delivered. Allowed value: `1.X` The value must start with a number (up to four digits), followed by a period and an uppercase X."
  type        = string
  default     = null
}

variable "overrides" {
  description = "(Optional) (Updatable) A set of overrides that control evaluations of the alarm."
  type = list(object({
    body             = optional(string)
    pending_duration = optional(string)
    query            = optional(string)
    rule_name        = optional(string)
    severity         = optional(string)
  }))
  default = []
}

variable "pending_duration" {
  description = "(Optional) (Updatable) The period of time that the condition defined in the alarm must persist before the alarm state changes from \"OK\" to \"FIRING\"."
  type        = string
  default     = null
}

variable "query" {
  description = "(Required) (Updatable) The Monitoring Query Language (MQL) expression to evaluate for the alarm."
  type        = string
}

variable "repeat_notification_duration" {
  description = "(Optional) (Updatable) The frequency for re-submitting alarm notifications, if the alarm keeps firing without interruption. Format defined by ISO 8601."
  type        = string
  default     = null
}

variable "resolution" {
  description = "(Optional) (Updatable) The time between calculated aggregation windows for the alarm. Supported value: `1m`"
  type        = string
  default     = null
}

variable "resource_group" {
  description = "(Optional) (Updatable) Resource group that you want to match."
  type        = string
  default     = null
}

variable "rule_name" {
  description = "(Optional) (Updatable) Identifier of the alarm's base values for alarm evaluation, for use when the alarm contains overrides.  Default value is `BASE`."
  type        = string
  default     = null
}

variable "severity" {
  description = "(Required) (Updatable) The perceived type of response required when the alarm is in the \"FIRING\" state.  Example: `CRITICAL`"
  type        = string
}

variable "suppression" {
  description = "(Optional) (Updatable) The configuration details for suppressing an alarm."
  type = object({
    description         = optional(string)
    time_suppress_from  = string
    time_suppress_until = string
  })
  default = null
}
