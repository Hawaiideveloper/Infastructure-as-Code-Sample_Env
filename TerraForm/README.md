# Terraform Getting started with EC2 and VPC


#### Install Terraform to version v0.14.3 for the approriate system and verify its installation


- [x] [MacOS](https://github.com/Hawaiideveloper/Sample_Env/blob/main/TerraForm/Installers/MacOS_TerraForm_Installer.sh)

- [ ] [Ubuntu](https://github.com/Hawaiideveloper/Sample_Env/blob/main/TerraForm/Installers/Ubuntu_TerraForm_installer.sh)

- [x] Setup auto complete if you want to short hand commands  by running this short script

###### terraform -install-autocomplete

##### check your version

#### Write a Terraform [production configuration file](https://github.com/Hawaiideveloper/Sample_Env/blob/main/TerraForm/production_site/main.tf) to launch 

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
    - [ ] Then when it is complete it prints the public IP to SSH into
  
  - example:
    ```
    Changes to Outputs:
    public_ip = "52.24.174.0"
    ```

#### However I see the future of this file looking huge and I would like to create a [.tvars extension file]()

The file will be used for:

- [ ] dev.tvars (within production directory)
- [ ] staging.tvars (hidden)
- [ ] production.tvars (hidden)


