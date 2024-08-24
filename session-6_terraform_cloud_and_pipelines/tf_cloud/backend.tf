terraform {
  backend "remote" {
    organization = "dnitros-org"

    workspaces {
      name = "dev"
    }
  }
}