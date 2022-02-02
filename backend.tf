terraform {
  backend "s3" {
    key        = "tfstate/tfstate.tfstate"
    bucket     = "ederluz-bucket"
    region     = "us-east-1"
    access_key = "AKIA4AC3LCBKEI6YN6B5"
    secret_key = "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"
  }
}


