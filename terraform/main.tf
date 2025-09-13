resource "portainer_stack" "vse002-swarm" {
  for_each = local.stacks

  name                      = each.key
  deployment_type           = "swarm"
  method                    = "repository"
  endpoint_id               = 1
  repository_url            = var.repository_url
  repository_reference_name = var.repository_ref
  file_path_in_repository   = each.value

  stack_webhook = true
  #prune         = true
}

resource "terraform_data" "trigger_webhook" {
  for_each = local.webhook_urls

  triggers_replace = {
    now = timestamp()
  }

  provisioner "local-exec" {
    command = "curl -fsS -X POST --max-time 20 ${each.value}"
  }

  depends_on = [
    portainer_stack.vse002-swarm
  ]
}
