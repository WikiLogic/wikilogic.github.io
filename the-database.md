# The Database (Neo4j)

## How to get it up and running

You will need git & Docker installed.

1. Clone the repo: `git clone https://github.com/WikiLogic/Neo4JProcedures.git`
2. From the repo's root run `docker build . -t wikilogic_dev_db`
3. `docker run -p 7474:7474 -p 7687:7687 --env NEO4J_AUTH=neo4j/neo5j wikilogic_dev_db` (set whatever password you want in here)
4. open [http://localhost:7474](http://localhost:7474) and log in to see your db!

When you run `docker build ...` it uses the Dockerfile from the repo to create an "image" from which a container can be spun up. `docker run ...` is the command that does the spinning up. 

Some helpful docker commands:

 - List docker images: `docker images`
 - List docker containers: `docker ps -a`
 - Stop container `docker stop <container name>`
 - Start container `docker start <container name>` (give it a few to boot up neo4j)
 - Delete all images `docker rmi $(docker images -q)`
 - Delete all containers `docker rm $(docker ps -a -q)`

### Problems

**Ports already allocated**: Note that every time you run `docker run...` it spins up a new container so if you do it more than once you're likly to run into port clashing issues. If that happens check if you have any containers already running. Stop them if there are then try starting a new container with the above command. It's often a good idea to clear out containers if you're developing.

**Docker is running but [http://localhost:7474](http://localhost:7474) isn't loading**: First, give it a few to let the DB boot up. There is also a gotcha to watchout for if you're using docker toolbox. It spins up a proper VM with virtualbox and runs the containers inside that. So make sure you're mapping ports from inside virtualbox to your host system. Otherwise your docker container might be working perfectly, but it's hidden away inside a Virtualbox VM.

---

## A Quick guide to the structure of our data

...

---

## The Wikilogic procedures

Set up for developing them...

An explanation of each...