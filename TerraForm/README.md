
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

#### However I see the future of this file looking huge and I would like to create a `.tfvars extension file`

The file will be used for:

- [x] [dev branch terraform.tfvars](https://github.com/Hawaiideveloper/Sample_Env/blob/dev_branch/TerraForm/production_site/terraform.tfvars) (within production directory and inside of the dev branch)
- [ ] staging branch terraform.tfvars (hidden)
- [ ] production branch terraform.tfvars (hidden)

I have included many ingress ports in this configuration, however I will at some point seperate the ports; but because this is a Dev site it has no important information nor does it bear confidential / sensitive information