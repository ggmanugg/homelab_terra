locals {
  compose_files = fileset("${path.module}/../stacks", "*/compose.yml")
  stacks = {
    for f in local.compose_files :
    split("/", f)[0] => f
  }
}