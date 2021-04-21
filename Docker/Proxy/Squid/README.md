Squid



### Configuration
If you need to make additional changes to the stock squid.conf file, you may do sp by tweaking squid.conf to your preference and then volume mounting it to /etc/squid/squid.conf. Please note that the stock configuration available with the container is set for local access, you may need to tweak it if your network scenario is different.

### Typically:

`docker run --name squid -d -p 3128:3128 Datadog/squid`

### Cache
If you wish to persist the cache, mount a volume to /var/spool/squid (make sure the right AppArmor or SELinux permissions are set at the mountpoint):

`docker run --name squid -d -p 3128:3128 --volume /home/foo/squid/cache:/var/spool/squid Datadog/squid`



### Logs
If you wish to have log persistance, mount a volume to /var/log/squid (again make sure the right AppArmor or SELinux permissions are set at the mountpoint):

`docker run --name squid -d -p 3128:3128 --volume /home/foo/squid/logs:/var/log/squid Datadog/squid`


### Usage
Once the container has been successfully deployed (assuming you have published port 3128) you should be able to run your traffic through the proxy by using localhost:3128 (on linux), or alternatively the address for your docker machine :3128 (172.17.42.1 in the examples).



~~~You may configure your browser to use that address:port, or at the shell:~~~

export ftp_proxy=http://172.17.42.1:3128
export http_proxy=http://172.17.42.1:3128
export https_proxy=http://172.17.42.1:3128