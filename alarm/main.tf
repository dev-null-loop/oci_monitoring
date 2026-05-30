resource "oci_monitoring_alarm" "this" {
  alarm_summary                                 = var.alarm_summary
  body                                          = var.body
  compartment_id                                = var.compartment_id
  defined_tags                                  = var.defined_tags
  destinations                                  = var.destinations
  display_name                                  = var.display_name
  evaluation_slack_duration                     = var.evaluation_slack_duration
  freeform_tags                                 = var.freeform_tags
  is_enabled                                    = var.is_enabled
  is_notifications_per_metric_dimension_enabled = var.is_notifications_per_metric_dimension_enabled
  message_format                                = var.message_format
  metric_compartment_id                         = var.metric_compartment_id
  metric_compartment_id_in_subtree              = var.metric_compartment_id_in_subtree
  namespace                                     = var.namespace
  notification_title                            = var.notification_title
  notification_version                          = var.notification_version
  dynamic "overrides" {
    for_each = var.overrides
    iterator = ov
    content {
      body             = ov.value.body
      pending_duration = ov.value.pending_duration
      query            = ov.value.query
      rule_name        = ov.value.rule_name
      severity         = ov.value.severity
    }
  }
  pending_duration             = var.pending_duration
  query                        = var.query
  repeat_notification_duration = var.repeat_notification_duration
  resolution                   = var.resolution
  resource_group               = var.resource_group
  rule_name                    = var.rule_name
  severity                     = var.severity
  dynamic "suppression" {
    for_each = var.suppression[*]
    iterator = su
    content {
      time_suppress_from  = su.value.time_suppress_from
      time_suppress_until = su.value.time_suppress_until
      description         = su.value.description
    }
  }
}
