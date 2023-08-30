

Remember, the bash script creates the environment and provisions necessary packages on an Ubuntu VM. Completing the Active Directory setup using Samba requires further steps and configurations. Ensure you understand and modify the configurations according to your requirements.




To use this script:

Save it to a file named setup-ad-controller.sh.
Make it executable: chmod +x setup-ad-controller.sh.
Run it: ./setup-ad-controller.sh.









env file:



# Active Directory Configurations
DOMAIN_NAME=mydomain.local
NETBIOS_NAME=MYDOMAIN
ADMIN_PASSWORD=StrongPassword123!






