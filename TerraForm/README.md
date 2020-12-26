
#### Terraform [production configuration file](https://github.com/Hawaiideveloper/Sample_Env/blob/main/TerraForm/production_site/main.tf) to launch 

The main.tf file will create a:

- [x] VPC
- [x] Security Group
- [x] Subnet
- [x] Key-pair
- [x] Internet gateway
- [x] Routing table
- [x] Route table association
- [x] Network Access Control List (acl)
- [x] Elastic IP
- [x] EC2-instance
    - [x] Then when it is complete it prints the public IP to SSH into
  
  - example:
    ```
    Changes to Outputs:
    public_ip = "52.24.174.0"
    ```


#### Terraform most useful [commands](https://www.terraform.io/docs/commands/index.html) below:


[terraform fmt](https://www.terraform.io/docs/commands/fmt.html) Use this command to format your terraform configuration file

[terraform init](https://www.terraform.io/docs/commands/init.html) Without this command nothing will start, you need to initialize the terraform before you issue any commands

[terraform plan](https://www.terraform.io/docs/commands/plan.html) This command will allow you to see the set of changes before you execute any configuration changes

[terraform apply](https://www.terraform.io/docs/commands/apply.html) This is the creation command that will build the infrastructure so that it is usable.

[terraform destroy](https://www.terraform.io/docs/commands/destroy.html) Use this to remove and delete all resources created by Terraform

#### However I see the future of this file looking huge and I would like to create a `.tfvars extension file`

The file will be used for:

- [x] [dev branch terraform.tfvars](https://github.com/Hawaiideveloper/Sample_Env/blob/dev_branch/TerraForm/production_site/terraform.tfvars) (within production directory and inside of the dev branch)
- [ ] staging branch terraform.tfvars (hidden)
- [ ] production branch terraform.tfvars (hidden)

I have included many ingress ports in this configuration, however I will at some point seperate the ports; but because this is a Dev site it has no important information nor does it bear confidential / sensitive information