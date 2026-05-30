variable "alarm_suppression_target" {
  description = "(Required) The target of the alarm suppression."
  type = object({
    alarm_id                  = optional(string)
    compartment_id            = optional(string)
    compartment_id_in_subtree = optional(bool)
    target_type               = string
  })
}

variable "defined_tags" {
  description = "(Optional) Usage of predefined tag keys. These predefined keys are scoped to namespaces. Example: `{\"Operations.CostCenter\": \"42\"}`"
  type        = map(string)
  default     = null
}

variable "description" {
  description = "(Optional) Human-readable reason for this alarm suppression. It does not have to be unique, and it's changeable. Avoid entering confidential information.\n\nOracle recommends including tracking information for the event or associated work, such as a ticket number.\n\nExample: `Planned outage due to change IT-1234.`"
  type        = string
  default     = null
}

variable "dimensions" {
  description = "(Required) A filter to suppress only alarm state entries that include the set of specified dimension key-value pairs."
  type        = map(string)
}

variable "display_name" {
  description = "(Required) A user-friendly name for the alarm suppression. It does not have to be unique, and it's changeable. Avoid entering confidential information."
  type        = string
}

variable "freeform_tags" {
  description = "(Optional) Simple key-value pair that is applied without any predefined name, type or scope. Exists for cross-compatibility only. Example: `{\"Department\": \"Finance\"}`"
  type        = map(string)
  default     = {}
}

variable "level" {
  description = "(Optional) The level of this alarm suppression. `ALARM` indicates a suppression of the entire alarm, regardless of dimension. `DIMENSION` indicates a suppression configured for specified dimensions.\n\nDefaut: `DIMENSION`"
  type        = string
  default     = null
}

variable "suppression_conditions" {
  description = "(Optional) Array of all preconditions for alarm suppression."
  type = list(object({
    condition_type         = string
    suppression_duration   = string
    suppression_recurrence = string
  }))
  default = []
}

variable "time_suppress_from" {
  description = "(Required) The start date and time for the suppression to take place, inclusive. Format defined by RFC3339.  Example: `2023-02-01T01:02:29.600Z`"
  type        = string
}

variable "time_suppress_until" {
  description = "(Required) The end date and time for the suppression to take place, inclusive. Format defined by RFC3339.  Example: `2023-02-01T02:02:29.600Z`"
  type        = string
}
