# What is Kubernetes
Is a framework to run distributed systems resiliently, and scales as well as does failovers for applications using containers.

## Why Use Kubernetes
In laymans terms it is used to prevet monolitic applications that are huge and difficult to manage due to their size and unadapitility for rolling updates or management of services.  Kubernetes is portable, extensible, and runs on an open-source platform.  It provides a container "juggler" approach to assist in minimizing downtime.  Technically speaking it provides an econsystem of tools that facilitate declarative configuration and automation.

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


### Get the load balancer working


- [ ] Then import all containers from docker into kubernetes to serve as a load balancer and if anything fails the integrity checks which will be monitored by [Jenkins_hourly_job]()
    - [ ] It will terminate and kubernetes will create another container then pull the most recent production branch for the site.
