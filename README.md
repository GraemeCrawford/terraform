# Terraform AWS Instructions

### Instructions for AWS

 https://www.terraform.io/intro/getting-started/install.html

---
You can either export the following values as environment variables:

**export AWS_ACCESS_KEY_ID="anaccesskey"**

**export AWS_SECRET_ACCESS_KEY="asecretkey"**

**export AWS_DEFAULT_REGION="eu-west-1"**

## OR

You can create a ```variables.tf``` file in the directory with the following contents:

```
variable "access_key" {default = "your_access_key"}
variable "secret_key" {default = "your_secret_key"}
variable "region" {default = "eu-west-1"}
```

and then access these in your example.tf file as per the following:

```
provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}
```
## OR
## Use command line variables:

```
$ terraform plan -var 'access_key=foo' -var 'secret_key=bar'
```

*Note: If you simply leave out AWS credentials, Terraform will automatically search for saved API credentials (for example, in ~/.aws/credentials) or IAM instance profile credentials. This option is much cleaner for situations where tf files are checked into source control or where there is more than one admin user. See details here. Leaving IAM credentials out of the Terraform configs allows you to leave those credentials out of source control, and also use different IAM credentials for each user without having to modify the configuration files.*


**Store tfstate files in a remote location if you work in a team:** https://www.terraform.io/docs/state/remote.html


### Explicit dependencies:

Implicit dependencies work well and are usually all you ever need. However, you can also specify explicit dependencies with the depends_on parameter which is available on any resource. For example, we could modify the "aws_eip" resource to the following, which effectively does the same thing and is redundant:

# **Modules**

https://www.terraform.io/docs/modules/index.html

### Get community modules here:

https://github.com/terraform-community-modules
