provider "aws" {
  region = var.aws_region
}

// Allows for a DR Region //
provider "aws" {
  region = var.aws_region_dr
  alias = "secondary"
}