resource "oci_monitoring_alarm_suppression" "this" {
  alarm_suppression_target {
    target_type               = var.alarm_suppression_target.target_type
    alarm_id                  = var.alarm_suppression_target.alarm_id
    compartment_id            = var.alarm_suppression_target.compartment_id
    compartment_id_in_subtree = var.alarm_suppression_target.compartment_id_in_subtree
  }
  display_name        = var.display_name
  time_suppress_from  = var.time_suppress_from
  time_suppress_until = var.time_suppress_until
  defined_tags        = var.defined_tags
  description         = var.description
  dimensions          = var.dimensions
  freeform_tags       = var.freeform_tags
  level               = var.level
  dynamic "suppression_conditions" {
    for_each = var.suppression_conditions
    iterator = sc
    content {
      condition_type         = sc.value.condition_type
      suppression_duration   = sc.value.suppression_duration
      suppression_recurrence = sc.value.suppression_recurrence
    }
  }
}
