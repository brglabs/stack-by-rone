variable "environment" {}

variable "aws_account" {}
variable "aws_region" {}
variable "aws_profile" {}

variable "custom_tags" {}

variable "project_name" {}

variable "squad_name" {}

variable "vpc_id" {
  default = {
    dev = "vpc-0b85794e6c0bbe8b4",
    hml = "vpc-0f6ead0ae65d73ac7",
    prd = "vpc-0b696120e7c526a4f"
  }
}

variable "vpc_tier" {
  default = "app-nat"
}

variable "schedules_list" {
  type = list(object({
    name                               = string,
    start_instance_description         = string,
    start_instance_schedule_expression = string,
    stop_instance_description          = string,
    stop_instance_schedule_expression  = string
  }))

  description = <<-EOT
    aaaaaaaaa
    bbbbbbbbb
  EOT

  /*
  validation {
    condition = length([
      for schedule in var.schedules_list : schedule
      if length(schedule.start_instance_description) >= 15
    ]) == length(var.schedules_list)
    error_message = "A variável \"start_instance_description\" deve ter igual ou maior que 15 caracteres."
  }

  validation {
    condition = length([
      for schedule in var.schedules_list : schedule
      if length(schedule.stop_instance_description) >= 15
    ]) == length(var.schedules_list)
    error_message = "A variável \"stop_instance_schedule_expression\" deve ter igual ou maior que 15 caracteres."
  }
*/
}

variable "webhook_office_cidrs" {
  description = <<-EOT
    Intervalos de endereços IP e URLs do Office 365
    https://docs.microsoft.com/pt-br/microsoft-365/enterprise/urls-and-ip-address-ranges?view=o365-worldwide#exchange-online
  EOT
}

variable "kms_key_id" {}

variable "lb_env_ssm_param_vpce" {

}

variable "lb_env_ssm_incoming_webhook" {

}