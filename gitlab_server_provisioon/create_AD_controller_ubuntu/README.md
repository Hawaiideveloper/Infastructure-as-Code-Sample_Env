

Remember, the bash script creates the environment and provisions necessary packages on an Ubuntu VM. Completing the Active Directory setup using Samba requires further steps and configurations. Ensure you understand and modify the configurations according to your requirements.


The network interface in the line config.vm.network "public_network", bridge: "en0: Wi-Fi (AirPort)" is just an example (specific to a macOS host). Adjust "en0: Wi-Fi (AirPort)" to match the interface name of your host machine's network interface that you want to bridge to. If unsure about the interface name, you can often omit the bridge: ... part, and Vagrant will prompt you to choose an interface when you run vagrant up.

The UFW rules set in the script are basic and only cover the typical Samba ports. Depending on the exact Active Directory functions and features you'll be using, additional firewall rules might be needed.

Remember that setting up Samba as an Active Directory Domain Controller requires additional steps that go beyond this script. The .env file provides placeholders; actual Active Directory configuration and integration need to be manually done post VM setup.

As always, when dealing with potentially impactful scripts, review and understand each part of the script before executing, especially if applied in sensitive or production environments

To use this script:

Save it to a file named setup-ad-controller.sh.
Make it executable: chmod +x setup-ad-controller.sh.
Run it: ./setup-ad-controller.sh.









env file:



# Active Directory Configurations
DOMAIN_NAME=mydomain.local
NETBIOS_NAME=MYDOMAIN
ADMIN_PASSWORD=StrongPassword123!






