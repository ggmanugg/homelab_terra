resource "portainer_stack" "vse002-swarm" {
  for_each = local.stacks

  name                      = each.key
  deployment_type           = "swarm"
  method                    = "repository"
  endpoint_id               = 1
  repository_url            = var.repository_url
  repository_reference_name = var.repository_ref
  file_path_in_repository   = each.value
  
  stack_webhook             = true
  #prune                     = true
}



#resource "terraform_data" "always" {
#  triggers_replace = timestamp()
#}



resource "portainer_stack_webhook" "fire" {
  for_each   = local.webhook_ids
  webhook_id = each.value

  # sorgt dafür, dass diese Resource bei JEDER Apply ersetzt wird -> Webhook feuert jedes Mal
 # lifecycle {
  #  replace_triggered_by = [terraform_data.always.id]
  #}

  # sicherstellen, dass Stacks bereits existieren
  depends_on = [portainer_stack.vse002-swarm]
}