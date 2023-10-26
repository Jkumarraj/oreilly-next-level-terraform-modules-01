/**
  * <!-- Module variables go here.
  *      Always include descriptions as they will populate
  *      autogenerated documentation. -->
*/

variable "name" {
  type        = string
  description = <<-EOT
      The name of the resources created by this module.
      This value is used as the basis for naming various resources.
    EOT
}

variable "ecs_cluster_id" {
  type        = string
  description = <<-EOT
    ECS Cluster to deploy to.
  EOT
}

variable "desired_count" {
  type        = number
  description = <<-EOT
    The number of service replicas.
  EOT
  default     = 2
}

variable "capacity_provider" {
  type        = string
  description = <<-EOT
    ECS Capacity Provider to use.
  EOT
}

variable "container_definitions" {
  type        = string
  description = <<-EOT
    A valid JSON document describing valid container definitions.
    See: http://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_ContainerDefinition.html
  EOT
}

variable "task_role_arn" {
  type        = string
  description = <<-EOT
    The ARN of IAM role that allows your Amazon ECS container task to make
    calls to other AWS services.
  EOT
  default     = null
}

variable "cpu" {
  type        = number
  description = <<-EOT
    The number of cpu units used by the task. If the `requires_compatibilities`
    is "FARGATE" this field is required.
  EOT
  default     = null
}

variable "memory" {
  type        = number
  description = <<-EOT
    The amount (in MiB) of memory used by the task. If the
    `requires_compatibilities` is "FARGATE" this field is required.
  EOT
  default     = null
}

variable "volumes" {
  type        = map(any)
  description = <<-EOT
    List of volume configurations.
  EOT
  default     = {}
}

variable "requires_compatibilities" {
  type        = list(string)
  description = <<-EOT
    Set of launch types required by the task. The valid values are EC2 and
    FARGATE.
  EOT
  default     = null
}

variable "task_tags" {
  type        = map(string)
  description = <<-EOT
    Key-value map of resource tags.
  EOT
  default     = null
}

variable "placement_constraints" {
  type        = map(any)
  description = <<-EOT
    Configuration block for rules that are taken into consideration during task
    placement. Maximum number of `placement_constraints` is 10.
  EOT
  default     = {}
}

variable "subnet_ids" {
  type        = list(string)
  description = <<-EOT
    Subnets associated with the task or service.
  EOT
}

variable "load_balancer_arn" {
  type        = string
  description = <<-EOT
    ARN of the loadbalancer to associate services with.
  EOT
}

variable "load_balancer_targets" {
  type        = map(any)
  description = <<-EOT
    Load balancer target configs.
  EOT
  default     = null
}

variable "fqdn" {
  type        = string
  description = <<-EOT
    Fully qualified domain name of load balanced service.
  EOT
}

variable "url_rewrites" {
  type        = map(any)
  description = <<-EOT
    A mapping of fqdns and rewrite rules.
    e.x.:
      {
        foo.dev-empire.com = "https://www.empi.re/listen/index.php?id=$1"
      }
  EOT
  default     = {}
}

variable "dns_routing_weight" {
  type        = number
  description = <<-EOT
    The weight can be a number between 0 and 255. If you specify 0, Route 53
    stops responding to DNS queries using this record.
  EOT
  default     = 255
}
