# Sample_Env

### Steps needed to create a cloud based environment with security and VPN

- [x] Create [AWS auth keys](https://github.com/Hawaiideveloper/Sample_Env/blob/main/Credentials_setup/Getting_Started_Step_1_after_README_AWS_Keys.md#step-5-add-user)
- [x] Add User to [Admin Group](https://github.com/Hawaiideveloper/Sample_Env/blob/main/Credentials_setup/Getting_Started_Step_1_after_README_AWS_Keys.md#make-a-group-name-called-admins)
- [x] Install the [AWS CLI](https://github.com/Hawaiideveloper/Sample_Env/blob/main/AWS_CLI/AWS_CLI_installer.sh)
- [x] Test your [AWS CLI](https://github.com/Hawaiideveloper/Sample_Env/blob/main/Credentials_setup/Getting_Started_Step_1_after_README_AWS_Keys.md#step-6-test-aws-cli)
- [x] Setup [access to create VPCs](https://github.com/Hawaiideveloper/Sample_Env/blob/main/Credentials_setup/Getting_Started_Step_1_after_README_AWS_Keys.md#make-a-group-name-called-vpcadmins)
- [x] Test your access to [create VPCs](https://github.com/Hawaiideveloper/Sample_Env/blob/main/Credentials_setup/Getting_Started_Step_1_after_README_AWS_Keys.md#--now-test-with-the-following-command)

- [ ] Launch EC2 with VPC using TerraForm
    - [ ] [Setup TerraForm](https://github.com/Hawaiideveloper/Sample_Env/tree/main/TerraForm)
    - [ ] Configure TerraForm
    - [ ] Create an EC2 and place it into a specified VPC
        - [ ] Create a plan for VPC
        - [ ] Create the EC2 and place it into the VPC
    - [ ] Setup VPN
    - [ ] Global authentication system for team logins
    - [ ] Setup DNS
        [ ] Optional setup Dynamic tunnels for agent services
    
- [ ] Using Ansible
    - [ ] Setup Ansible
    - [ ] Configure Ansible
    - [ ] Test Ansible
    - [ ] Deploy configuration and installation of applications listed below inside of EC2
        - [ ] Git
            - [ ] Getting started with Docker and its images
            - [ ] Build Jenkins image
            - [ ] Using Jenkins
                - [ ] Setup Jenkins into container
                - [ ] Deploy KanBoard container object
                - [ ] Deploy NodeJS App container
                - [ ] Create a website container
        - [ ] Getting started with Kubernetes
            - [ ] Setup and Install
            - [ ] Management of containers and review dashboard
            - [ ] Setup load balancer
            - [ ] Spin-up and turn down of containers
      
        
### Migrations of VMs to Containers
- [ ] Migrate Web server to a new container
- [ ] Migrate MongoDB documents to new MongoDB container
    
    

   









### References:


#### You will need AWS keys to manage your infrastructure as code IaC
Because we all know the lifecycle of infrastructure is short and many derecation will happen after I write this repo in full.  Therefore to save time, it is 
best to build a system that allows growth.  But it is lengthy to login each time and perform an action via web/GUI.  However in the event things get compromised, or we loose a system due to its integrity or reliability.  You will need to be authenticated properly to manage AWS services. 


#### AWS CLI
This is the Command Line interface to the AWS services


#### Git 
This is great for versioning and helps you to track both changes and assist you in creating tests that can be staged and then later moved to production.  The rules are simple, each time you make a change to production, you need to overwrite the test environment, and staging environment with new Git commits.

#### Docker 
This eliminates the expensive and lengthy process to stand up environments and systems.  Each time a system fails, or needs to be upgraded, or restarted, it will take a fraction of the time.  However using a virtual machine, is great to host the docker service as it will sit inside of our EC2 instance.

#### Terraform 
Great for making a contract ... plan to spin up entire environments that can be used immediately and eliminates the need to manually setup resources.  Simply looked up the provider and its syntax to implement resources from companies like docker, google, amazon, microsoft and more.

#### Kubernetes
I have choosen to use Kubernetes as I like the way google manages containers, plus the terraform plug-in for docker references swarm which is a competitor of kubernets and although it may be a great application.  I find that more companies are using Kubernets to get things done faster.

[Docker with Terraform](https://www.hashicorp.com/integrations/docker/terraform) - Docker is a container platform market that enables developers and IT operations to build, secure and manage applications without technology or infrastructure lock in. By bringing together traditional applications and microservices built on Windows, Linux and mainframe under one operating model, Docker’s container platform enables the companies to accelerate key digital initiatives including cloud migration, application modernization and edge computing.

#### Jenkins

Is basically a launcher and a good manager for pipelines

#### Kanboard

It is difficult to know what your customers or bosses want without a plan, therefore all organized people should have a kanboard


