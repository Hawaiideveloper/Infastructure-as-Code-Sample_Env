* I was going to migrate today from the current production blusky7 but then I realized, I would end up with two environments and could potentially end up paying for the resources that terraform created.

* However the plan would now be:
* Make note of the current configurations and match them with what I have in Terraform
* Then delete all resources that would result in a duplicate 
* Once all is removed that would present a duplicated entry
* I would then delete all default things in a region.  Then launch the terraform configuration.

#### And allow docker to run the website 
- Finally create another container and move the DB to that one



# Docker has some internal commands here and we will not be covering them all that at not directly related to our work.



### The first thing here is to serve our content's static website


- [ ] Start the Engine with Ansible
    - [ ] Connect the Container storage
    - [ ] Pull down a Jenkins docker container and connect it to the HA storage


- [ ] Create an Apache_Site that will repeatedly pull the production site and its latest code continously and allow users to change branches to test the code. 
