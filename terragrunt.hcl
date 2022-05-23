remote_state {
  backend = "s3"
  config = {
    bucket  = "customer-${get_aws_account_id()}-environment-project-region-tf"
    key     = "terragrunted/${path_relative_to_include()}.tfstate"
    region  = ""
    encrypt = true
  }
}



terraform {
  extra_arguments "common_vars" {
    commands = get_terraform_commands_that_need_vars()
  }

  before_hook "before_hook" {
    commands     = ["apply", "plan"]
    execute      = ["echo", "Running Terraform"]
  }

  after_hook "after_hook" {
    commands     = ["apply", "plan"]
    execute      = ["echo", "Finished running Terraform"]
    run_on_error = true
  }
}

generate "providers" {
  path      = "providers.tf"
  if_exists = "overwrite"
  contents  = <<EOF

  terraform {
    backend "s3" {}
  }
EOF
}