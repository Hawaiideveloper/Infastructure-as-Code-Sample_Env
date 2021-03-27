# Automated Infrastructure as Code (IaC) Sample_Environment for public Clouds


#### *Note: Please use the [dev_branch](https://github.com/Hawaiideveloper/Sample_Env/tree/dev_branch) if you are actively building with this document.  As the dev_branch will have the nightly builds.  The [main_branch](https://github.com/Hawaiideveloper/Sample_Env/tree/main) is the stable branch; but it will lack all current updates .*

#### Why create this?
Because if we don't have our IaC we will spend all of our time building and have no time to actually create products that our present and future customers want.  It is good to practice our complete disaster recovery skills as well as enrich our CI/CD so our skills stay fresh and our environment is easy to operate.  However environments will get old and we will possibly need them to recover our life's work.  
Not too mention people will probably make [human errors](https://en.wikipedia.org/wiki/Human_error#:~:text=Human%20error%20refers%20to%20something,system%20outside%20its%20acceptable%20limits%22.)  Nothing is worse than getting a 2am call and having to perform a task... while half asleep.

#### What will this do?
This will create a universal system that uses  [Pipelines from Jenkins](https://github.com/Hawaiideveloper/Infastructure-as-Code-Sample_Env/tree/dev_branch/Jenkins/pipeline) that can be transported to other cloud providers using the universal agonistic tools.  It starts with AWS and will later integrate with other providers like:
- Google cloud compute (GCP)
- Microsoft Azure
- Oracle cloud
- Digital Ocean


## Disclaimer:
> *Use of this repo constitutes your willingness and liability to read and make your own decisions.  This repo is for educational experimental use only.  Therefore all liability, or legal matters are forfeited by both the reader and writer for this walkthrough and all of its documentation provides no guarantee of services and/or content may change without notice.  Neither AlcoTerra, Halfaway Services or any company that Corey Albright works with or for or afterwards constitues an agreement or liability to access such systems or any liability.*  For this tutorial the author assumes the use of a MacOS device.  The authors preferred system of choice.  It is recommended that the user find(s) an equivelent systems like Linux or have access to a terminal based system like Windows Subsystem for Linux.  To proceed with the documentation.


## Amazon Section

### Steps needed to create a cloud based environment with security and VPN in Amazon Web Services (AWS) that **can be easily migrated to other clouds with agonostic tools** 


- [x] Create [AWS auth keys](https://github.com/Hawaiideveloper/Sample_Env/blob/main/Credentials_setup/Getting_Started_Step_1_after_README_AWS_Keys.md#step-5-add-user)
- [x] Add User to [Admin Group](https://github.com/Hawaiideveloper/Sample_Env/blob/main/Credentials_setup/Getting_Started_Step_1_after_README_AWS_Keys.md#make-a-group-name-called-admins)
- [x] Install the [AWS CLI](https://github.com/Hawaiideveloper/Sample_Env/blob/main/AWS_CLI/AWS_CLI_installer.sh)
- [x] Test your [AWS CLI](https://github.com/Hawaiideveloper/Sample_Env/blob/main/Credentials_setup/Getting_Started_Step_1_after_README_AWS_Keys.md#step-6-test-aws-cli)
- [x] Setup [access to create VPCs](https://github.com/Hawaiideveloper/Sample_Env/blob/main/Credentials_setup/Getting_Started_Step_1_after_README_AWS_Keys.md#make-a-group-name-called-vpcadmins)
- [x] Test your access to [create VPCs](https://github.com/Hawaiideveloper/Sample_Env/blob/main/Credentials_setup/Getting_Started_Step_1_after_README_AWS_Keys.md#--now-test-with-the-following-command)
- [x] Give your account S3 permissions
    - [x] Go to IAM
    - [x] Select your User
    - [x] Click Add permissions
    - [x] Create group
    - [x] Name the group S3Admins
    - [x] Search from AmazonS3FullAccess and select it
    - [x] Review
    - [x] Add Permisisons

- [x] Use a [Terraform](https://github.com/Hawaiideveloper/Sample_Env/tree/main/TerraForm/) configuration file to standup a production environment

- [x] Test some [Bash scripts](https://github.com/Hawaiideveloper/Infastructure-as-Code-Sample_Env/tree/dev_branch/Bash_Helper_Scripts) first as we need to ensure Ansible has the needed resources   
   
- [x] Use [Ansible](https://github.com/Hawaiideveloper/Infastructure-as-Code-Sample_Env/tree/dev_branch/Ansible) to configure the previous environment that Terraform created
  

### Migrations of VMs to Containers
- [x] [Why Docker?](https://github.com/Hawaiideveloper/Infastructure-as-Code-Sample_Env/blob/dev_branch/Docker/README.md#why-docker)
- [ ] [Deploy a Jenkins image](https://www.jenkins.io/doc/book/installing/docker/) and configure
    - [x] Getting started with Docker and its images
- [x] Migrate Web server to a new container
- [ ] Migrate MongoDB documents to new MongoDB container
 - [ ] Setup Domain Name Server (DNS) container
    - [ ] Setup Simple Mail Transport Protocol (SMTP) server
    - [ ] Setup Virtual Private Network (VPN)
    - [ ] Global LDAP/PAM authentication system for team logins
    - [ ] Optional setup Dynamic tunnels for agent services
    - [ ] Bonus 
      - [ ] Setup Asterisk server to call us 

### Jenkins
- [ ] Build Jenkins image
    - [ ] Create a [Jenkins Pipeline ~ Jenkinsfile located at root](https://github.com/Hawaiideveloper/Infastructure-as-Code-Sample_Env/tree/dev_branch/Jenkins/pipeline)
        - [ ] [Jenkinsfile](https://github.com/Hawaiideveloper/Infastructure-as-Code-Sample_Env/blob/dev_branch/Jenkins/pipeline/Jenkinsfile)
          - [ ] Deploy KanBoard container object
            - [ ] Launch NodeJS App container
            - [ ] Launch Docker website container


   
        
## Kubernetes
- [ ] [Setup and Install](https://github.com/Hawaiideveloper/Infastructure-as-Code-Sample_Env/tree/dev_branch/Ansible/Production/Kubernetes)
- [ ] Setup [load balancer](https://kubernetes.io/docs/concepts/services-networking/)
- [ ] Launch within [Pipeline](https://github.com/Hawaiideveloper/Infastructure-as-Code-Sample_Env/tree/dev_branch/Jenkins#why-a-pipeline)

        
      
        

    
    

   









### References:


#### You will need AWS keys to manage your infrastructure as code IaC
Because we all know the lifecycle of infrastructure is short and many derecation will happen after I write this repo in full.  Therefore to save time, it is 
best to build a system that allows growth.  But it is lengthy to login each time and perform an action via web/GUI.  However in the event things get compromised, or we loose a system due to its integrity or reliability.  You will need to be authenticated properly to manage AWS services. 

##### Don't forget to change your keys every 30 days

###### How to [rotate keys via CLI](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html#Using_CreateAccessKey_CLIAPI) "Scroll down half way in the page after you click the link"


#### Pricing

##### [Amazon's Elastic File System (EFS)](https://aws.amazon.com/efs/pricing/)
    - Within your first 12 months on AWS, you can use up to 5 GB/month on the EFS Standard storage class for free.

Assume your file system is located in the US East (N. Virginia) region, uses 100 GB of EFS Standard storage, and uses 400 GB of EFS Infrequent Access storage for the entirety of a 31 day month. At the end of the month, you would have the following usage in GB-Hours:

Total EFS Standard usage (GB-Hours): 100 GB x 31 days x (24 hours / day) = 74,400 GB-Hours
Total EFS IA usage (GB-Hours): 400 GB x 31 days x (24 hours / day) = 297,600 GB-Hours
We add up GB-Hours and convert to GB-Month to calculate monthly charges:
Total EFS Standard storage charge: 74,400 GB-Hours x (1 month / 744 hours) x $0.30/GB-month = $30.00
Total EFS IA storage charge: 297,600 GB-Hours x (1 month / 744 hours) x $0.025/GB-month = $10.00
Total Monthly Storage Charge: $30.00 + $10.00 = $40.00 or $.08/GB-month

##### [Simple storage (S3)](https://aws.amazon.com/s3/pricing/?sc_channel=ps&sc_campaign=acq_LATAMO&sc_publisher=google&sc_category=storage&sc_country=LATAMO&sc_geo=LATAM&sc_outcome=acq&sc_detail=amazon%20s3%20pricing&sc_content=S3_e&sc_matchtype=e&sc_segment=453309460993&sc_medium=ACQ-P|PS-GO|Brand|Desktop|SU|Storage|Product|LATAMO|EN|Sitelink&s_kwcid=AL!4422!3!453309460993!e!!g!!amazon%20s3%20pricing&ef_id=CjwKCAiA8ov_BRAoEiwAOZogwdXKGR915L2mtiu30jLfTsAJOb9-ERFCWsq-yoAcn0mUVTgm8rznKhoCQkMQAvD_BwE:G:s&s_kwcid=AL!4422!3!453309460993!e!!g!!amazon%20s3%20pricing)

Tiered price for: 120 GB
120 GB x 0.0230000000 USD = 2.76 USD
Total tier cost = 2.7600 USD (S3 Standard storage cost)
1,000 PUT requests for S3 Storage x 0.000005 USD per request = 0.005 USD (S3 Standard PUT requests cost)
1,000 GET requests in a month x 0.0000004 USD per request = 0.0004 USD (S3 Standard GET requests cost)
120 GB x 0.0007 USD = 0.084 USD (S3 select returned cost)
120 GB x 0.002 USD = 0.24 USD (S3 select scanned cost)
2.76 USD + 0.0004 USD + 0.005 USD + 0.084 USD + 0.24 USD = 3.09 USD (Total S3 Standard Storage, data requests, S3 select cost)
S3 Standard cost (monthly): 3.09 USD

###### $30.00 vs. $3.09 
**I pick the slower option since this is going to be a "cheap" sample env**

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
