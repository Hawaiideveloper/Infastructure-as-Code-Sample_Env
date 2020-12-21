# AWS Keys are the very first thing you need 
---

### to get going and successful on building automation for the project mentioned in the README


## Disclaimer:
> *Use of this repo constitutes your willingness and liability to read and make your own decisions.  This repo is for educational experience only.  Therefore all liability, or legal matters are forfeited by both the reader and writer of this walkthrough and all of its documentation provides no guarantee of services and content may change without notice.  Neither AlcoTerra, Halfawayservices or any company that Corey Albright works with or for or afterwards constitues an agreement or liability to access such systems or any liability.*  For this tutorial I will be mentioning MacOS commands as that is my preferred system.  It is recommended that the user find equivelent systems like Linux or have access to a terminal based system like Windows Subsystem for Linux.




####  Step 1: Read the README so you know what is the plan!

####  Step 2: AWS  console
 - [ ] Use this [link](https://aws.amazon.com/console/) to quickly find it and setup an account
 - [x] Use this if you already have an AWS account [link to login](https://signin.aws.amazon.com/signin?redirect_uri=https%3A%2F%2Fconsole.aws.amazon.com%2Fconsole%2Fhome%3Fstate%3DhashArgs%2523%26isauthcode%3Dtrue&client_id=arn%3Aaws%3Aiam%3A%3A015428540659%3Auser%2Fhomepage&forceMobileApp=0&code_challenge=dlhxv7rVnZ0x4unaEqcagTwHiG4e80jbd2ij_UMuq-0&code_challenge_method=SHA-256)
 
### Step 3: Go to the Security, Identity, & Compliance Section and select IAM
### Step 4: Look on the left under Access Management and search for Users
### Step 5: Add User
 - [x] I recommend a user with numbers and letters so it is not easily compromised
 - [x] Give the user Programmatic access
 - [x] Setup permission boundary to control where the user can access
 - [x] I selected AdminstratorAccess
     - [x] Add a key-value pair so you can quickly recognize the user
 - [x] Make note of your login URL it will be something like:
     - [ ]  https://12345678912344.signin.aws.amazon.com/console
     - [x] download your .csv and get both your:
         - [ ] Access Key
         - [ ] Secret access key

### Step 6: Test AWS CLI 
- [ ] You will need access to a command line interface
- [ ] Feel free to read through [this document](https://github.com/Hawaiideveloper/Sample_Env/blob/main/aws-cli-reads.pdf) if you want learn more about the AWSCLI
 - Use [Windows subshell](https://docs.microsoft.com/en-us/windows/wsl/install-win10) if you do not have a linux or MacOs system. 
 
- [ ] Install AWSCLI
    - [ ] [MacOS](https://docs.aws.amazon.com/cli/latest/userguide/install-macos.html)
        - Later on I will be using linux and the virtual env (Jenkins as my launcher for everything) as I hate remembering anything and Jenkins allows a section for notes and such
        - Latest version of AWS CLI
        - [Script for AWS CLI installer](https://github.com/Hawaiideveloper/Sample_Env/blob/main/AWS_CLI_installer.sh)
          
        ```curl -LJO https://raw.githubusercontent.com/Hawaiideveloper/Sample_Env/branch/AWS_CLI_installer.sh```
    
    - [ ] [Linux](https://docs.aws.amazon.com/cli/latest/userguide/install-linux.html)
      - [virtual environment](https://docs.aws.amazon.com/cli/latest/userguide/install-virtualenv.html)
      
### Step 7: Launch an EC2 instance using the AWSCLI and your access Key from step 5



## Recommendation #1
Get yourself a [password manager](https://www.cnet.com/how-to/best-password-manager-to-use-for-2020-1password-lastpass-and-more-compared/) that can record passwords for you or use the old school paper and pad
However thing could really suck if you are away from your paper and pad and need to do something magical from a plane because of an emergency:
- I have been on flights and with family and my job needs me to do something and I forgot that paper at home
    - [x] Lastpass is my 1st choice
    - [ ] Keepass is my  2nd choice



####  Go to your favorite web browser 
- [x] I like google chrome, but feel free to use your favorite one that supports JavaScript
    - [x] Google provides a console that is seemless and also allows me to inspect elements as well as change thigns real-time and see the effects immediately


 
 
 
 
 #### Next setup a service user ... i.e. never use the root account as you could end up with
 - unautorized access
 - make sure to add it to your password mananager
