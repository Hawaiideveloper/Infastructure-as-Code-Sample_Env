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

### Katacoda Webhook
Using Katacoda for labs and setup a testing environment to do such a task.  Please feel free to visit [here](https://www.katacoda.com) to setup an account and begin testing things.

![Screen Shot 2021-04-17 at 3 49 09 PM](https://user-images.githubusercontent.com/13468708/115125241-c2604f80-9f94-11eb-9ebe-73bfce3c0798.png)



### Getting started and getting things installed

#### "Quick script is [here](install_payloader.sh) -Use at your own risk-"
  
    


_A layman explanation between miniKube and kubeCtl is that minikube is a local installation and a kubectl is an enterprise type thing.  Basically minikube would function like an ESX host and kubeCtl would be vsphere.  The second best way to explain would be managing a horse(minikube) or managing the track for many horses(kubectl).
- [miniKube](https://minikube.sigs.k8s.io/docs/start/)

Requirements: 
    - 2 CPUs or more  
    - 2GB of free memory  
    - 20GB of free disk space  
    - Internet connection  
    - Container or virtual machine manager, such as: Docker  

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



### Control plane:
The control plane's components make global decisions about the cluster (for example, scheduling), as well as detecting and responding to cluster events (for example, starting up a new pod when a deployment's replicas field is unsatisfied).

Control plane components can be run on any machine in the cluster. However, for simplicity, set up scripts typically start all control plane components on the same machine, and do not run user containers on this machine. 









### Get the load balancer working 


- [ ] Then import all containers from docker into kubernetes to serve as a load balancer and if anything fails the integrity checks which will be monitored by [Jenkins_hourly_job]()
    - [ ] It will terminate and kubernetes will create another container then pull the most recent production branch for the site.









## Troubleshooting possible issues:

The following Docker runtime security options are currently unsupported and will not work with the Docker driver (see #9607):


- [userns-remap](https://docs.docker.com/engine/security/userns-remap/)  
- [rootless](https://docs.docker.com/engine/security/rootless/)  
- [kubeadm_iptables see bridged traffic](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/)