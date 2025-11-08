module "naming" {
  source       = "app.terraform.io/traindevsecops/tf-az-naming-convention/azure"
  version      = "1.0.1"
  project_name = "learn"
  environment  = "dev"
}