#!/bin/bash



# Ensure proper permissions
sudo usermod -aG docker $USER && newgrp docker



# Pull the docker 
docker pull datadog/squid



# Without cache
#docker run --name squid -d -p 3128:3128 datadog/squid



# With Cache (uncomment if you want cache)
docker run --name squid -d -p 3128:3128 --volume /home/foo/squid/cache:/var/spool/squid Datadog/squid





