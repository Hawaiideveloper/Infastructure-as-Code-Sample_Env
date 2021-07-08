# What is it:   
This is a feature that will allow us to make a ready to use Database Backend System MongoDB service structure that can be managed through the webUI and supports a noSQL structure known as a MongoDB document.  The advantages will provide scability and horizontal growth if needed.  

## Why:  
Because all of Clexys.com work must be repeatable and able to grow globallly and be launched by scripts, this particular feature offers MongoDB backend and webUI front-end.

## When: 
We use this to build the backend of the applications by running a jenkins job on demand, in layman terms, if we experience any latency, or issues.  It will be easy to just launch another one

## Where: 
It can be launched natively and is not tied to any specific "borrowed resources" as they say, the worse kinda car to travel across the country with is a leased one.  I rather be slower than taxed all the way there.  However this will work in AWS, Azure, Digital Ocean, Google, and the Oracle cloud.  However for this specific service we are isolating the needed responsibilities so that we are not reliant on any single point of failure (hardware / software/ internet).  We simply rollback / upgrade / push configurations using PRs or previous states

## How: 
Manually run with CLI that is native to Ubuntu since Ubuntu has a wealth of opensource contributors and they even offer support contracts

## Who: 
Jenkins, can build this job, and deployment via a series of scripts within [Jenkinsfile](../../Jenkins/pipeline/MongoDB_JOB/MongoDB_Jenkinsfile)


## Security:
Secrets live within k8s not within the repo see issue [40](https://github.com/Hawaiideveloper/Infastructure-as-Code-Sample_Env/issues/40) they are referenced [using key value pairs](https://github.com/Hawaiideveloper/Infastructure-as-Code-Sample_Env/issues/40#issuecomment-876639221)

## Configuration files





**** Refererence Video is located [here](https://www.youtube.com/watch?v=EQNO_kM96Mo) however if you are like me, you find it faster and quicker without rewinding and watching over and over.  But it is a good source for a reference point if you should decide to validate your work.  The Lady named "Nana" who provided the explanation is a good commentary and documentation video.


