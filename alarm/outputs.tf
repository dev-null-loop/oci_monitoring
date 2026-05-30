output "id" {
  description = "The OCID of the alarm."
  value       = oci_monitoring_alarm.this.id
}

output "state" {
  description = "The current state of the alarm."
  value       = oci_monitoring_alarm.this.state
}

output "time_created" {
  description = "The date and time the alarm was created, expressed in RFC 3339 timestamp format."
  value       = oci_monitoring_alarm.this.time_created
}

output "time_updated" {
  description = "The date and time the alarm was updated, expressed in RFC 3339 timestamp format."
  value       = oci_monitoring_alarm.this.time_updated
}
