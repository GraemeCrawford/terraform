# Terraform

**export AWS_ACCESS_KEY_ID="anaccesskey"**

**export AWS_SECRET_ACCESS_KEY="asecretkey"**

**export AWS_DEFAULT_REGION="us-west-2"**


Note: If you simply leave out AWS credentials, Terraform will automatically search for saved API credentials (for example, in ~/.aws/credentials) or IAM instance profile credentials. This option is much cleaner for situations where tf files are checked into source control or where there is more than one admin user. See details here. Leaving IAM credentials out of the Terraform configs allows you to leave those credentials out of source control, and also use different IAM credentials for each user without having to modify the configuration files.


**Store tfstate files in a remote location if you work in a team:** https://www.terraform.io/docs/state/remote.html
