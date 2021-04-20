#!/bin/bash



# Ensure proper permissions




# Pull the docker 




# Without cache
docker run --name squid -d -p 3128:3128 Datadog/squid



# With Cache (uncomment if you want cache)
# docker run --name squid -d -p 3128:3128 --volume /home/foo/squid/cache:/var/spool/squid Datadog/squid





