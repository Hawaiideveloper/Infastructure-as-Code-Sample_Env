# Automated Infrastructure as Code (IaC) Sample_Environment for public Clouds


#### *Note: Please use the [dev_branch](https://github.com/Hawaiideveloper/Sample_Env/tree/dev_branch) if you are actively building with this document.  As the dev_branch will have the nightly builds.  The [main_branch](https://github.com/Hawaiideveloper/Sample_Env/tree/main) is the stable branch; but it will lack all current updates .*

#### Why create this?
Because if we don't have our IaC we will spend all of our time building and have no time to actually create products that our present and future customers want.  I is good to practice our complete disaster recovery skills as well as enrich our CI/CD so our skills stay fresh and our environment is easy to operate.  However environments will get old and we will possibility need them to recover our life's work.  Not too mention people will probably make [human errors](https://en.wikipedia.org/wiki/Human_error#:~:text=Human%20error%20refers%20to%20something,system%20outside%20its%20acceptable%20limits%22.)  Nothing is worse than getting a 2am call and having to perform a task while half asleep.

#### What will this do?
This will create a universal system that can be transported to other cloud providers using agonistic tools.  It starts with AWS and will later integrate with other providers like:
- Google cloud compute (GCP)
- Microsoft Azure
- Oracle cloud
- Digital Ocean


## Disclaimer:
> *Use of this repo constitutes your willingness and liability to read and make your own decisions.  This repo is for educational experimental use only.  Therefore all liability, or legal matters are forfeited by both the reader and writer for this walkthrough and all of its documentation provides no guarantee of services and/or content may change without notice.  Neither AlcoTerra, Halfawayservices or any company that Corey Albright works with or for or afterwards constitues an agreement or liability to access such systems or any liability.*  For this tutorial the author assumes the use will be using a MacOS device as that is the authors preferred system.  It is recommended that the user find(s) equivelent systems like Linux or have access to a terminal based system like Windows Subsystem for Linux.  To proceed with the documentation.






## Amazon Section

### Steps needed to create a cloud based environment with security and VPN in Amazon Web Services (AWS) that **can be easily migrated to other clouds with agonostic tools** 


- [x] Create [AWS auth keys](https://github.com/Hawaiideveloper/Sample_Env/blob/main/Credentials_setup/Getting_Started_Step_1_after_README_AWS_Keys.md#step-5-add-user)
- [x] Add User to [Admin Group](https://github.com/Hawaiideveloper/Sample_Env/blob/main/Credentials_setup/Getting_Started_Step_1_after_README_AWS_Keys.md#make-a-group-name-called-admins)
- [x] Install the [AWS CLI](https://github.com/Hawaiideveloper/Sample_Env/blob/main/AWS_CLI/AWS_CLI_installer.sh)
- [x] Test your [AWS CLI](https://github.com/Hawaiideveloper/Sample_Env/blob/main/Credentials_setup/Getting_Started_Step_1_after_README_AWS_Keys.md#step-6-test-aws-cli)
- [x] Setup [access to create VPCs](https://github.com/Hawaiideveloper/Sample_Env/blob/main/Credentials_setup/Getting_Started_Step_1_after_README_AWS_Keys.md#make-a-group-name-called-vpcadmins)
- [x] Test your access to [create VPCs](https://github.com/Hawaiideveloper/Sample_Env/blob/main/Credentials_setup/Getting_Started_Step_1_after_README_AWS_Keys.md#--now-test-with-the-following-command)

- [x] Use a [Terraform](https://github.com/Hawaiideveloper/Sample_Env/tree/main/TerraForm/) configuration file to standup a production environment
    
   
- [ ] Use Ansible to configure the previous environment that Terraform created
    - [ ] Setup Ansible
    - [ ] Configure Ansible
    - [ ] Test Ansible
    - [ ] Setup VPN
    - [ ] Global authentication system for team logins
    - [ ] Setup DNS
        [ ] Optional setup Dynamic tunnels for agent services
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


## Google cloud compute (GCP) Section

- Not complete will be created at a later date

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

#### Create Cloud AWS Diagrams
[Cloudcraft](https://www.cloudcraft.co/?utm_source=terraform-aws-vpc)

### About me:

[Click Here for more information about me](https://hawaiideveloper.github.io/) 