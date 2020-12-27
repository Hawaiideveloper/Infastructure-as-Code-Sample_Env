Docker Install and configuration of Jenkins Container:

##### This addresses [issue 6](https://github.com/Hawaiideveloper/Infastructure-as-Code-Sample_Env/issues/6#issuecomment-751418702)

[Docker bridge](https://www.bogotobogo.com/DevOps/Docker/Docker-Bridge-Driver-Networks.php)
	
###### Mapping local file system to internal docker container    
    Maps the /var/jenkins_home directory in the container to the Docker volume with the name jenkins-data. Instead of mapping the /var/jenkins_home directory to a Docker volume, you could also map this directory to one on your machine’s local file system. For example, specifying the option
--volume $HOME/jenkins:/var/jenkins_home would map the container’s /var/jenkins_home directory to the jenkins subdirectory within the $HOME directory on your local machine, which would typically be /Users/<your-username>/jenkins or /home/<your-username>/jenkins. Note that if you change the source volume or directory for this, the volume from the docker:dind container above needs to be updated to match this.





# [Jenkinsfile](https://www.jenkins.io/doc/book/pipeline/jenkinsfile/) 

### Creating a Jenkinsfile, which is checked into source control [1], provides a number of immediate benefits:

- Code review/iteration on the Pipeline
- Audit trail for the Pipeline
- Single source of truth [2] for the Pipeline, which can be viewed and edited by multiple members of the project.
---
## [The Desired result](https://github.com/Hawaiideveloper/Infastructure-as-Code-Sample_Env/issues/6) 
*is the outcome we expect for all the applications and their perspective scripts, and configurations written within the [main README.md](https://github.com/Hawaiideveloper/Infastructure-as-Code-Sample_Env), once all of them line-up it is basically a [Jenkins pipeline](https://www.jenkins.io/doc/book/pipeline/) that we are after that will* **build our entire infrastructre by running a single Jenkins job**


## Why a Pipeline?
    Jenkins is, fundamentally, an automation engine which supports a number of automation patterns.   
###### *Pipelines add a powerful set of automation tools onto the Jenkins platform, supporting use cases that span from simple continuous integration to comprehensive CD pipelines.*

 ###### By modeling a series of related tasks, users can take advantage of the many features of Pipeline:

- Code: Pipelines are implemented in code and typically checked into source control, giving teams the ability to edit, review, and iterate upon their delivery pipeline.
- Durable: Pipelines can survive both planned and unplanned restarts of the Jenkins controller.
- Pausable: Pipelines can optionally stop and wait for human input or approval before continuing the Pipeline run.
- Versatile: Pipelines support complex real-world CD requirements, including the ability to fork/join, loop, and perform work in parallel.
- Extensible: The Pipeline plugin supports custom extensions to its DSL footnote:dsl: and multiple options for integration with other plugins.