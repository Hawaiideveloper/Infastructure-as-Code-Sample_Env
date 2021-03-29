# What is Kubernetes
Is a framework to run distributed systems resiliently, and scales as well as does failovers for applications using containers.

## Why Use Kubernetes
Kubernetes is portable, extensible, and runs on an open-source platform.  It provides a container "juggler" approach to assist in minimizing downtime.  Technically speaking it provides an econsystem of tools that facilitate declarative configuration and automation.

## Where to get Kubernetes
Kubernetes is a free software that is highly distributed for Linux, Windows, and macOS.  [Download your perspective version of Kubernetes](https://kubernetes.io/docs/tasks/tools/)

### Get the load balancer working


- [ ] Then import all containers from docker into kubernetes to serve as a load balancer and if anything fails the integrity checks which will be monitored by [Jenkins_hourly_job]()
    - [ ] It will terminate and kubernetes will create another container then pull the most recent production branch for the site.
