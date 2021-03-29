# Kubernetes
Provides a container "juggler" approach to assist in minimizing downtime.  Technically speaking it provides a framework to run distributed systems resiliently, and scales as well as does failovers for applications.

### Get the load balancer working


- [ ] Then import all containers from docker into kubernetes to serve as a load balancer and if anything fails the integrity checks which will be monitored by [Jenkins_hourly_job]()
    - [ ] It will terminate and kubernetes will create another container then pull the most recent production branch for the site.
