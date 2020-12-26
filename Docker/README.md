## Some valuable Docker notes:

Docker is used to launch a lightweight microservice that "usually" performs one critical service.  Usually you want to use Docker to do such a microservice like:

- Mail (SMTP) Service
- DNS Service
- Website
- Database
- etc.



# Docker has some internal commands here and we will not be covering them all that at not directly related to our work.



### The first thing here is to serve our content's static website


- [ ] Start the Engine with Ansible
    - [ ] Connect the Container storage
    - [ ] Pull down a Jenkins docker container and connect it to the HA storage


- [ ] Create an Apache_Site that will repeatedly pull the production site and its latest code continously and allow users to change branches to test the code. 



A docker container can launch itself faster than a normal VM with minimum services.  I have taken the time to write down some key commands like:

#### [docker-machine start "docker host"](https://docs.docker.com/machine/get-started/) start your docker host.

[docker-machine env](https://docs.docker.com/machine/reference/env/)Set environment variables to dictate that docker should run a command against a particular machine.

[docker exec -it container_name bash](https://docs.docker.com/engine/reference/commandline/exec/) Run a command in a running container


[docker rmi](https://docs.docker.com/engine/reference/commandline/rmi/) Removes (and un-tags) one or more images from the host node. If an image has multiple tags, using this command with the tag .

[docker ps -a](https://docs.docker.com/engine/reference/commandline/ps/) List all containers.

[docker pull "debian/name"](https://docs.docker.com/engine/reference/commandline/pull/)  To download a particular image, or set of images (i.e., a repository), use docker pull. If no tag is provided, Docker Engine uses the :latest tag as a default. This command pulls the debian:latest

[docker push "username/container_name"](https://docs.docker.com/engine/reference/commandline/push/)Use docker image push to share your images to the Docker Hub registry or to a self-hosted one.

[docker run -d "container_name"](https://docs.docker.com/engine/reference/run/) To start a container in detached mode, you use -d=true or just -d option.

[docker rm $(docker ps -aq)](https://stackoverflow.com/questions/51894136/ubuntu-docker-rm-docker-ps-a-q-got-permission-denied) to remove all the stopped containers

[docker stop container_id](https://docs.docker.com/engine/reference/commandline/stop/) Stop one or more running containers.

[docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' container_name_or_id](https://stackoverflow.com/questions/17157721/how-to-get-a-docker-containers-ip-address-from-the-host) will give you the ip address of the container asformentioned

[docker container ls -a](https://docs.docker.com/engine/reference/commandline/container_ls/)List containers

#### Example to run a sample NodeJS app in detached mode with two exposed ports:

###### The below example exposes port 3000 and port 8080 and forwards them to 3000 and 80 so when a user goes to http://localhost:8080 or  http://localhost:3000 they will see their app running.

####### docker run -d -p 3000:3000 -p 8080:80 [image_name]:tag

* I was going to migrate today from the current production blusky7 but then I realized, I would end up with two environments and could potentially end up paying for the resources that terraform created.

* However the plan would now be:
* Make note of the current configurations and match them with what I have in Terraform
* Then delete all resources that would result in a duplicate 
* Once all is removed that would present a duplicated entry
* I would then delete all default things in a region.  Then launch the terraform configuration.

#### And allow docker to run the website 
- Finally create another container and move the DB to that one