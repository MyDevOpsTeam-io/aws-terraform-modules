/*
 * # AWS GlueJob Terraform Module 💡
 * Description
 * ============
 * This tf file provides GlueJob resources definition for TF Modules <br>
 * ***Author***: Alfred Valderrama (@redopsbay) <br>
*/


terraform {
  required_version = ">= 0.13.1"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=4.0.0"
    }
  }
}
