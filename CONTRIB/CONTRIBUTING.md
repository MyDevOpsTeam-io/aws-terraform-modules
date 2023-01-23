Contribution guidelines
========================

Do you want to help us make it easier for terraform users to create their infrastructure? Please forked this repo and submit a pull requests and we will review your `PR`. 😃


Coding Style Guide
====================

![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)
![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white)

Generate TF Documentation via CLI
===================================

Generate terraform module documentation via `terraform-docs`.

Quick Reference: [Terraform Docs Official Repository](https://github.com/terraform-docs/terraform-docs)


```bash
terraform-docs markdown table . --output-file README.md --output-mode inject
```

Notes on proper TF Documentation 📔
====================================
- Determine the required variables on a terraform module by removing default values on the variable definition. So `terraform-docs` can determine which one is a required variable or not when generating a `README.md` file for user manual.
- Author of terraform module is optional for future questions if there is a business/control flow logic error on the templates. 

  > This can be done by creating a comment on top of `main.tf` file and `terraform-docs` will distinguish and append the comment on `README.md` file. For example: `main.tf`
  ```hcl
    /*
    * # AWS Lambda Terraform Module 💡
    * Description
    * ============
    * This tf file provides lambda resources definition for TF Modules <br>
    * ***Author***: Alfred Valderrama (@redopsbay) <br>
    */

    resource "aws_lambda_function" "lambda" {
        filename                       = var.filename
        function_name                  = var.func_name
        runtime                        = var.runtime
        role                           = var.arn_role
        handler                        = var.handler_name
        source_code_hash               = filebase64sha256(var.filename)
        memory_size                    = var.memsize
        timeout                        = var.timeout
        tags                           = var.tags
        architectures                  = var.arch
        reserved_concurrent_executions = var.reserved_concurrent_executions
        kms_key_arn                    = var.kms_arn == "" || var.kms_arn == null ? null : var.kms_arn
        description                    = var.description == "" || var.description == null ? null : var.description

        code_signing_config_arn = var.codesigning_arn == "" || var.codesigning_arn == null ? null : var.codesigning_arn
    ...

  ```


Conventions
============

### Versioning

Given a version number **MAJOR**.**MINOR**.**PATCH**, increment the: <br>
> **MAJOR** - version when you make incompatible API changes,<br>
>
> **MINOR** version when you add functionality in a backwards compatible manner, and <br>
>
> **PATCH** version when you make backwards compatible bug fixes. <br>
>
> Additional labels for **pre-release** and **build metadata** are available as `prefix` or `suffix` to the **MAJOR.MINOR.PATCH** format. For example: `eks-v1.0.0-alpha`


Conventions
============
- Module/folder name should be named as `resource name` <br>
    for example: `eks`,`securitygroup` see below:
    ```bash
    ├── README.md
    ├── eks
    │   ├── README.md
    │   ├── main.tf
    │   ├── outputs.tf
    │   ├── variables.tf
    │   └── versions.tf
    └── securitygroup
        ├── README.md
        ├── main.tf
        ├── outputs.tf
        ├── variables.tf
        └── versions.tf

    2 directories, 13 files
    ```

- State of versioning should be go through `alpha` -> `beta` -> `stable` to identify the current state of tf-module release. So we can determine which one is more stable.

- Pulling module from CodeCommit should reference a git tag with a resource name. <br>
  > **Example**: `https://github.com/MyDevOpsTeam-io/aws-terraform-modules.git/eks?ref=eks-v1.0.0-alpha`


Things to have in mind
=======================
- Version state and semantic versioning should be followed to identify which one is the latest one.
- Always provide terraform provider version and terraform required version on `versions.tf` file.


Generate TF Docs 💡
===================

Before commit and push your code to codecommit. You should make sure run the following commands:
```bash
terraform fmt
terraform validate
terraform-docs markdown table . --output-file README.md --output-mode inject
```

***Note: Make sure your on the right directory.***


CHANGELOGS 🆚
==============

Refer to: [CHANGELOG.md](https://github.com/MyDevOpsTeam-io/aws-terraform-modules/blob/master/CHANGELOG.md)


Generating `CHANGELOG.md`
=========================
Installing utility tool.

```bash
sudo pip3 install git-changelog
```

```bash
git-changelog -s basic -t keepachangelog -o CHANGELOG.md .
```
***Note: You should specify the absolute path of the local repository***

Finding the latest version
============================
To find the latest release from git tags. For example: **Find the latest version of eks terraform module.**
```bash
git tag --list | sort -r  | grep eks-
```
