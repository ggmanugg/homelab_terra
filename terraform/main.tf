resource "portainer_stack" "vse002-swarm" {
  for_each = local.stacks

  name                      = each.key
  deployment_type           = "swarm"
  method                    = "repository"
  endpoint_id               = var.portainer_endpoint_id
  repository_url            = var.repository_url
  repository_reference_name = var.repository_ref
  file_path_in_repository   = each.value

  # Optional GitOps enhancements:
  stack_webhook             = true                      # Enables GitOps webhook
  force_update              = true                       # Prune services not in compose file
}