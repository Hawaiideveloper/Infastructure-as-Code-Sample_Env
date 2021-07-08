## Prerequeistes 
- [ ] [Flatcar](https://kinvolk.io/docs/flatcar-container-linux/latest/installing/bare-metal/booting-with-iso/) Linux OS iso file
  
- [ ]  [Automated Iginition](https://github.com/kinvolk-archives/lokomotive-kubernetes/blob/master/docs/flatcar-linux/bare-metal.md) to install K8s

or... 

You can do it manually below:
### Step 1:
~~Install Docker using the following document located [here]()~~  
Due to docker-shim being considered deprecated in future releases [(please see notes)](https://github.com/Hawaiideveloper/Infastructure-as-Code-Sample_Env/issues/37)
We will install [containerd](https://github.com/Hawaiideveloper/Infastructure-as-Code-Sample_Env/issues/38#issuecomment-874896012) it does not need docker shim and will be extremely light and not resource heavy.



### Step 2:
Please be sure to follow the instructions [here](../install_payloader_minikube.sh) to get Kubernetes installed and configured.  My recommendation is to use an Ubuntu VM

### Step 3:
Follow the [manual instructions]() to configure mongodb









### Foot notes:
#### Ignition
Ignition is a new provisioning utility designed specifically for container OSs like Flatcar Container Linux, which allows you to manipulate disks during early boot. This includes partitioning disks, formatting partitions, writing files (regular files, systemd units, networkd units, and more), and configuring users. On the first boot, Ignition reads its configuration from a source-of-truth (remote URL, network metadata service, or hypervisor bridge, for example) and applies the configuration.

Ignition Examples: https://github.com/kinvolk/ignition/blob/flatcar-master/doc/examples.md


#### Deployment in Kubernetes
```kubectl apply -f mogo.yaml``` 11:41