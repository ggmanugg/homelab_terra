locals {
  compose_files = fileset("${path.module}/../stacks", "*/compose.yml")
  stacks = {
    for f in local.compose_files :
    split("/", f)[0] => "stacks/${f}"
  }
}

locals {
  webhook_urls = {
    for k, s in portainer_stack.vse002-swarm :
    k => sensitive(s.webhook_url)
  }
}