output "id" {
  description = "The OCID of the alarm suppression."
  value       = oci_monitoring_alarm_suppression.this.id
}

output "state" {
  description = "The current state of the alarm suppression."
  value       = oci_monitoring_alarm_suppression.this.state
}

output "time_created" {
  description = "The date and time the alarm suppression was created, expressed in RFC 3339 timestamp format."
  value       = oci_monitoring_alarm_suppression.this.time_created
}

output "time_updated" {
  description = "The date and time the alarm suppression was updated, expressed in RFC 3339 timestamp format."
  value       = oci_monitoring_alarm_suppression.this.time_updated
}
