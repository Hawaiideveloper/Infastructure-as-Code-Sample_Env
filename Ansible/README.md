# Ansible plan



## Ansible --> Docker ---> Jenkins
*Setup our new Jenkins server with Ansible by pulling down a docker Jenkins container*


### Get our storage working then use Ansible to connect it

- [ ] Prerequistes are to give our account permissions to read/write/execute S3 buckets operations
- [ ] Then automate it with bash and use Ansible to run the shell script later it will need access to your keys.  I recommend [rotating them monthly using the CLI]()


- [ ] Step 1: We need to attach S3 or EFS storage to our bare-metal(new ec2 instance) "no one wants to manually connect each time we spin up our Jenkins instance.  Plus S3 is accessible from external providers.
          - [x] Option 1 is [S3FS](https://github.com/s3fs-fuse/s3fs-fuse)
              - [x] Based on [S3 pricing](https://github.com/Hawaiideveloper/Infastructure-as-Code-Sample_Env/tree/dev_branch#simple-storage-s3) I am going with a slower model


          - [ ] Option 2 is [RioFS](https://github.com/skoobe/riofs) "renaming is a no go 12-23-2020 tested"
      - [ ] Option 3 is [EFS](https://aws.amazon.com/efs/faq/)

- [ ] Step 2: To limit the constant annoyance of degraded speed we can copy our S3 contents to the mounted local storage of our container's persistent volume, and then setup versioning that would easily allow syncing should we have a failure that requires us to resume on another instance.




### Setup Ansible to configure our Jenkins instance 
    - [ ] Setup Ansible 
    - [ ] Configure Ansible
      - [ ] Setup [playbook(s) & roles]() 
        - [ ] Install Git 
        - [ ] Install Docker
        - [ ] Then connect Github to a team Jenkins account   
        - [ ] Connect **HA**  Storage solution to the EC2 that was created with [Terraform](https://github.com/Hawaiideveloper/Infastructure-as-Code-Sample_Env/blob/main/TerraForm/production_site/main.tf)
 









## Amazon:

---

#### I will be using S3 to limit our costs and to scale across regions and other cloud providers.

### Amazon Storage solutions:



The main differences between EBS and EFS is that EBS is only accessible from a single EC2 instance in your particular AWS region, while EFS allows you to mount the file system across multiple regions and instances.

Finally, Amazon S3 is an object store good at storing vast numbers of backups or user files. Unlike EBS or EFS, S3 is not limited to EC2. 

Files stored within an S3 bucket can be accessed programmatically or directly from services such as AWS CloudFront. This is why many websites use it to hold their content and media files, which may be served efficiently from AWS CloudFront

##### EBS

Business consistency: Copy EBS Snapshots and Amazon Machine Images (AMIs) to run applications in different AWS regions. This reduces data loss and speeds recovery time by backing up log files and data regularly, across geographies.

Performance optimization: Increase throughput by devoting network capacity and minimizing the network contention between your instances and EBS.
Low-latency performance: By using SSD EBS volumes, it offers reliable I/O performance scaled to meet your workload needs.
Highly available and secure storage: EBS volumes offer redundancy within its Availability Zones while access control and encryption bolster security.
Geographic interchangeability: With EBS, you can duplicate snapshots throughout AWS regions and place resources and data in multiple locations. This makes disaster recovery, data center migration, and geographical expansion simple.
Easy data backup and restoration: Point-in-time volume snapshots safeguard data.
Rapid up- or down-scaling: EBS can quickly scale volumes, ensuring you get the right performance and capacity for changing computing needs.

##### EFS
Cost savings: The only storage you’ll pay for is exactly what you use, as there’s no advance provisioning, up-front fees, or commitments. Moreover, you can use Lifecycle Management to transfer files that have been unused for a month to a more cost-effective storage class, which can lower expenses up to 85%.

Content management system and web server support: EFS is a robust throughput file system capable of enabling content management systems and web serving applications, such as archives, websites, or blogs.

It can provide higher throughput in spurts that match sudden file system growth, even for workloads up to 500,000 IOPS or 10 GB per second.

EFS is the best choice for running any application that has a high workload, requires scalable storage, and must produce output quickly. It scales automatically, even to meet the most abrupt workload spikes. After the period of high-volume storage demand has passed, EFS will automatically scale back down. EFS can be mounted to different AWS services and accessed from all your virtual machines. Use it for running shared volumes, or for big data analysis. You’ll always pay for the storage you actually use, rather than provisioning storage in advance that’s ultimately wasted.


##### S3

Reliable disaster recovery: S3 storage, S3 Cross-Region Replication and additional AWS networking, computing, and database services make it easy to protect critical applications, data, and IT systems. It offers nimble recovery from outages, no matter if they are caused by system failures, natural disasters, or human error.

S3 provides object storage. Each object has its own unique identifier or key, for access through web requests from any location. S3 also supports static web content hosting that can be accessed from the S3 bucket or from AWS CloudFront. And S3 is notably secure, providing. “eleven nines” - 99.999999999 of data durability.

Robust performance, scalability, and availability: Amazon S3 scales storage resources free from resource procurement cycles or investments upfront. It keeps your data safe from errors, failures, and threats and makes it available when you need it.

Cost-saving storage classes: Storing data throughout S3 storage classes saves costs and maintains high levels of performance. Storage class analysis enables you to locate data that may be moved to a lower-cost storage class. Then you can make the transfer using an S3 Lifecycle policy. Finally, S3 intelligent-tiering enables the storage of data that has changing or unknown access patterns by tiering objects, which cuts storage costs.
Easier security, compliance, and audit features: S3 can store data and protect it from unauthorized access using its powerful access management and encryption tools. S3 has features that make it easy to comply with regulatory requirements, and Amazon Macie can deny irregular access requests to your sensitive data. Plus, S3 works well with AWS’ many auditing features.
Exacting data control: An array of management tools enable you to classify and report on data. S3 has storage class analysis that monitors access patterns, while S3 Lifecycle analyzes object transfers to lower-cost storage. S3 Object Lock assigns retention dates to objects to prevent deletion, and S3 Inventory offers visibility of stored objects and their encryption and metadata. Finally, S3 Batch Operations can run storage management maintenance for billions of objects while AWS Lambda can be used to automate workflows, define alerts and log activities without added management of infrastructure.