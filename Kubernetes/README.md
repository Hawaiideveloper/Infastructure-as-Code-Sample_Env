# What is Kubernetes
Is a framework to run distributed systems resiliently, and scales as well as does failovers for applications using containers.

## Why Use Kubernetes
In laymans terms it is used to prevet monolitic applications that are huge and difficult to manage due to their size and unadapitility for rolling updates or management of services.  Kubernetes is portable, extensible, and runs on an open-source platform.  It provides a container "juggler" approach to assist in minimizing downtime.  Technically speaking it provides an econsystem of tools that facilitate declarative configuration and automation.

## Where to get Kubernetes
Kubernetes is a free software that is highly distributed for Linux, Windows, and macOS.  [Download your perspective version of Kubernetes](https://kubernetes.io/docs/tasks/tools/)

## How does it work
![Screen Shot 2021-03-29 at 7 13 38 PM](https://user-images.githubusercontent.com/13468708/112911365-470d2b80-90c3-11eb-925d-cf92466c037f.png)

## Kubernetes Features
- [x] Health Checks
- [x] Managing multiple containers as one entity
- [x] Resource Monitoring
- [x] Networking
- [x] Rolling updates
- [x] Load Balancing

### Get the load balancer working


- [ ] Then import all containers from docker into kubernetes to serve as a load balancer and if anything fails the integrity checks which will be monitored by [Jenkins_hourly_job]()
    - [ ] It will terminate and kubernetes will create another container then pull the most recent production branch for the site.
