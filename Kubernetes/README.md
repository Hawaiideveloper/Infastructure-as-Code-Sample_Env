# What is Kubernetes
Is a framework to run distributed systems resiliently, and scales as well as does failovers for applications using containers.

## Why Use Kubernetes
In laymans terms it is used to prevet monolitic applications that are huge and difficult to manage due to their size and unadapitility for rolling updates or management of services.  Kubernetes is portable, extensible, and runs on an open-source platform.  It provides a container "juggler" approach to assist in minimizing downtime.  Technically speaking it provides an econsystem of tools that facilitate declarative configuration and automation.

Furthermore ... With modern web services, users expect applications to be available 24/7, and developers expect to deploy new versions of those applications several times a day. Containerization helps package software to serve these goals, enabling applications to be released and updated without downtime. Kubernetes helps you make sure those containerized applications run where and when you want, and helps them find the resources and tools they need to work. Kubernetes is a production-ready, open source platform designed with Google's accumulated experience in container orchestration, combined with best-of-breed ideas from the community.

## Where to get Kubernetes
Kubernetes is a free software that is highly distributed for Linux, Windows, and macOS.  [Download your perspective version of Kubernetes](https://kubernetes.io/docs/tasks/tools/)

## How does it work

A Kubernetes cluster consists of a set of worker machines, called nodes, that run containerized applications. Every cluster has at least one worker node.

The worker node(s) host the Pods that are the components of the application workload. The control plane manages the worker nodes and the Pods in the cluster. In production environments, the control plane usually runs across multiple computers and a cluster usually runs multiple nodes, providing fault-tolerance and high availability.  

See diagram below which gives a 5000ft overview
![Screen Shot 2021-03-29 at 7 20 33 PM](https://user-images.githubusercontent.com/13468708/112911634-d74b7080-90c3-11eb-90d2-6e8e085759d7.png)


## Kubernetes Features
- [x] Health Checks
- [x] Managing multiple containers as one entity
- [x] Resource Monitoring
- [x] Networking
- [x] Rolling updates
- [x] Load Balancing

Kubernetes provides you with:

- Service discovery and load balancing Kubernetes can expose a container using the DNS name or using their own IP address. If traffic to a container is high, Kubernetes is able to load balance and distribute the network traffic so that the deployment is stable.  
 
- Storage orchestration Kubernetes allows you to automatically mount a storage system of your choice, such as local storages, public cloud providers, and more.  
- Automated rollouts and rollbacks You can describe the desired state for your deployed containers using Kubernetes, and it can change the actual state to the desired state at a controlled rate. For example, you can automate Kubernetes to create new containers for your deployment, remove existing containers and adopt all their resources to the new container.  
- Automatic bin packing You provide Kubernetes with a cluster of nodes that it can use to run containerized tasks. You tell Kubernetes how much CPU and memory (RAM) each container needs. Kubernetes can fit containers onto your nodes to make the best use of your resources.  
- Self-healing Kubernetes restarts containers that fail, replaces containers, kills containers that don't respond to your user-defined health check, and doesn't advertise them to clients until they are ready to serve.  
- Secret and configuration management Kubernetes lets you store and manage sensitive information, such as passwords, OAuth tokens, and SSH keys. You can deploy and update secrets and application configuration without rebuilding your container images, and without exposing secrets in your stack configuration.  



### Getting Started:
  - We will be using Digital Ocean for our tutorial and it will be based on [issue_01](https://github.com/Hawaiideveloper/Infastructure-as-Code-Sample_Env/issues/1#issuecomment-855467625) also due to the length of time needed to manual install and configure a running and working cluster we will be using a hosted provider as well.  However if you wish to locally host a cluster please see the section entitled [How to build and monitor local host a cluster]




###### "Quick Kubernetes script is [here](install_payloader.sh) -Use at your own risk-"  
  
    or...  follow the instructions here for Virtual machine with 3 processors and 3GB memory and Solid state drive with 40GB  


### To host a local cluster please review:
Issue 15 in the following [Thread](https://github.com/Hawaiideveloper/Infastructure-as-Code-Sample_Env/issues/15#issuecomment-811350626) will provide the needed resources and installation that will enable you to get started quickly with a VM that has Ubuntu 20.04
##### To get Kubernetes manually installed
    Step 1:  To install VirtualBox Headless on Ubuntu Server, run the command:
```sudo apt install virtualbox virtualbox-ext-pack```  

    Step 2: Confirm the installation with y and hit Enter.  
    Step 3: Next, the licence agreement appears on the screen. Press Tab and then Enter to continue  
    Step 4: The installer asks you to agree with the terms of the VirtualBox PUEL license by selecting Yes.  
    Step 5: Wait for everything to finish and proceed to step 6  
    Step 6: Download the latest Minikube binary using the wget command:
    ```wget https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64```
    Step 7: Copy the downloaded file and store it into the /usr/local/bin/minikube directory with.  
```sudo cp minikube-linux-amd64 /usr/local/bin/minikube```
    Step 8: Next, give the file executive permission using the chmod 
    ```sudo chmod 755 /usr/local/bin/minikube``
    Step 9: Finally, verify you have successfully installed Minikube by checking the version of the software
    ```minikube version```
    Step 9: Download kubectl with the following command
    ```curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl```
    Step 10: Make the binary executable by typing
    ```chmod +x ./kubectl```
    Step 11: Move the binary into your path with the command:
    ```sudo mv ./kubectl /usr/local/bin/kubectl```
    Step 12: Verify the installation by checking the version of your kubectl instance
```kubectl version -o json```
    Step 13: Start your personalized minikube
    ```minikube start```


#### To review your installation and test if it is running correctly
    Step 14: To see the kubectl configuration
    ```kubectl config view```
    Step 15: To show the cluster information
    ```kubectl cluster-info```
    Step 16: To check running nodes use the following command
    ```kubectl get nodes```
    Step 17: To see a list of all the Minikube pods
    ```kubectl get pod```
    Step 18: To ssh into the Minikube VM
    ```minikube ssh```
    Step 19: To exit out of the shell
    ```exit```
    Step 20: To stop running the single node cluster
    ```minikube stop```
    Step 21: To check its status 
    ```minikube status```
    Step 22: To enable and access the Minikube dashboard via terminal
    ```minikube dashboard```
    Step 23: Acquire the dashboard’s IP address
    ```minikube dashboard --url```
    Step 24: Check external IP
    ```kubectl get svc```


    ### Exposing an External IP Address to Access an Application in a Cluster





_A layman explanation between miniKube and kubeCtl is that minikube is a local installation and a kubectl is an enterprise type thing.  Basically minikube would function like an ESX host and kubeCtl would be vsphere.  The second best way to explain would be managing a horse(minikube) or managing the track for many horses(kubectl).
- [miniKube](https://minikube.sigs.k8s.io/docs/start/)

Requirements: 
    - 2 CPUs (I personally have seen crashes with 2, so if possible use VM and make it 3)
    - 2GB of free memory is not enough, make it 3  
    - 20GB of free disk space  
    - Internet connection  
    - Container or virtual machine manager, such as: Docker  / VirtualBox Hypervisor

minikube is local Kubernetes, focusing on making it easy to learn and develop for Kubernetes.

All you need is Docker (or similarly compatible) container or a Virtual Machine environment, and Kubernetes

- [kubectl](https://minikube.sigs.k8s.io/docs/handbook/kubectl/) and its [Cheat Sheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)

    - ? Hardware requirements?

gets configured to access the kubernetes cluster control plane inside minikube when the minikube start command is executed.

However if kubectl is not installed locally, minikube already includes kubectl

- [kubeadm]()
    - A compatible Linux host. The Kubernetes project provides generic instructions for Linux distributions based on Debian and Red Hat, and those distributions without a package manager.
    - 2 GB or more of RAM per machine (any less will leave little room for your apps).
    - 2 CPUs or more.
    - Full network connectivity between all machines in the cluster (public or private network is fine).
    - Unique hostname, MAC address, and product_uuid for every node. See here for more details.
    - Certain ports are open on your machines. See here for more details.
    - Swap disabled. You MUST disable swap in order for the kubelet to work properly.



##### ["kubeadm join ["[api-server-endpoint]"](https://kubernetes.io/docs/reference/command-line-tools-reference/kube-apiserver/) [flags]"]


### Control plane:
The control plane's components make global decisions about the cluster (for example, scheduling), as well as detecting and responding to cluster events (for example, starting up a new pod when a deployment's replicas field is unsatisfied).

Control plane components can be run on any machine in the cluster. However, for simplicity, set up scripts typically start all control plane components on the same machine, and do not run user containers on this machine. 






###  StatefulSets 
A StatefulSets is like a Deployment which manages Pods and guarantees about the ordering and uniqueness of these Pods. It maintains a sticky identity for each of their Pods. It helps in deployment of application that needs persistency, unique network identifiers (DNS, Hostnames etc) and are meants for stateful application. If a pod gets terminated or deleted, a volume data will remain intact if managed by persistentvolumes.


### StorageClass
StorageClass helps in administration to describe the “classes” of storage offered by Kubernetes. Each StorageClass has different provisioner (GCEPersistentDisk, AWSElasticBlockStore, AzureDisk etc) that determines what volume plugin is used for provisioning storage.

### PersistentVolume
A PersistentVolume (PV) is a piece of storage in the cluster that has been provisioned by an administrator. PVs are resources available to be used by any Pod. Any Pod can claim these volumes by mean of PersistentVolumeClaims (PVC) and released eventually when claim is deleted.

### Headless Services
Headless Services are used to configure DNS of pods having same selectors defined by services. It is not generally used for load-balancing purpose. Each headless services configured with label selectors helps in defining unique network identifiers for pods running in statefulset.





### Get the load balancer working 


- [ ] Then import all containers from docker into kubernetes to serve as a load balancer and if anything fails the integrity checks which will be monitored by [Jenkins_hourly_job]()
    - [ ] It will terminate and kubernetes will create another container then pull the most recent production branch for the site.









## Troubleshooting possible issues:

The following Docker runtime security options are currently unsupported and will not work with the Docker driver (see #9607):


- [userns-remap](https://docs.docker.com/engine/security/userns-remap/)  
- [rootless](https://docs.docker.com/engine/security/rootless/)  

- [kubeadm_iptables see bridged traffic](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/)

- [kubeadm_iptables see bridged traffic](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/)

