### Before we can authenticate and login with SSH we need to:
- [ ] Create a keypair
    - [ ] To get a keypair you need to type the following:
       - aws ec2 create-key-pair --key-name MyKeyPairExample --query 'KeyMaterial' --output text > MyKeyPairExample.pem
    - [ ] Set proper permissions or you will get crazy errors, type the following command below:
       - chmod 400 MyKeyPairExample.pem
- [ ] Create a VPC
