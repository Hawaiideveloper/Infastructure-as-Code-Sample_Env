# What is it:   
This is a feature that will allow us to make a ready to use Database structure that can be managed through the webUI of NginX that supports a noSQL structure known as a MongoDB document.  The advantages will provide scability and horizontal growth if needed.  


## Why:  
Because all of Clexys.com work must be repeatable and able to be launched by scripts, this particular feature offers MongoDB backend and webUI front-end.


## When: 
We use this to build the backend of the applications by running a jenkins job on demand

## Where: 
Isolated the needed responsibilities so that we are not reliant on a single point of failure.  We simply rollback / upgrade using PRs or previous states

## How: 
Manually run with CLI that is native to Ubuntu/Redhat preference is RedHat/Centos as it offers support contracts

## Who: 
Jenkins, can build this job, and deployment via a series of scripts








**** Refererence Video is located [here](https://www.youtube.com/watch?v=EQNO_kM96Mo) however if you are like me, you find it faster and quicker without rewinding and watching over and over.  But it is a good source for a reference point if you should decide to validate your work.  The Lady named "Nana" who provided the explanation is a good commentary and documentation video.


