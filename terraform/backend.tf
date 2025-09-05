terraform {
  cloud {
    organization = "Home-Manu"
    workspaces {
      name = "homelab_portainer"
    }
  }
}