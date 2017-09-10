# The Database (Neo4j)

## How to get it up and running

_Note these instructions are for running the Neo4j container for development. If you're looking to get all the contaiers that make up WL running locally check the homepage, we have an easier way to get everything up and running all at once (possbily, still to write that up)_

You will need [git](https://git-scm.com/) & [Docker](https://www.docker.com/) installed.

1. Clone the repo: `git clone https://github.com/WikiLogic/Neo4JProcedures.git`
2. From the repo's root (cd in) run `docker build . -t wikilogic_dev_db` (note the `.`, it's important!) This creates an image from which many containers can be spun up, like a blueprint.
3. Start up the container with some options: `docker run -p 7474:7474 -p 7687:7687 --env NEO4J_AUTH=neo4j/neo5j -v /c/Users/ijmcc/Projects/Wikilogic/data:/data wikilogic_dev_db`
    - `NEO4J_AUTH` sets the username and password `neo4j/neo5j`. These can be replaced with `NEO4J_AUTH=none` to turn auth off. We recommend keeping it on as we use authentication in production.
    - `-v` maps a directory from the container into your host system in order to save any data you enter in. **It's important to change the above command to match your local set up** as I doubt your username is also "ijmcc". Note that it requires an absolute path, no "./data" unfortunatly. We will be creating demo / dev data but in the mean time, if you have interesting demo data to share, get in contact with us! Either an issue or the foundation website should be good places to go.
4. open [http://localhost:7474](http://localhost:7474) (and log in with neo4j/neo5j if you didn't tweak the auth settings) to see your new local Neo4j database!


### Problems

**Ports already allocated**: Note that every time you run `docker run...` it spins up a new container so if you do it more than once you're likly to run into port clashing issues. If that happens check if you have any containers already running. Stop them if there are then try starting a new container with the above command. It's often a good idea to clear out containers if you're developing.

**Docker is running but [http://localhost:7474](http://localhost:7474) isn't loading**: First, give it a few to let the DB boot up. There is also a gotcha to watchout for if you're using docker toolbox. It spins up a proper VM with virtualbox and runs the containers inside that. So make sure you're mapping ports from inside virtualbox to your host system. Otherwise your docker container might be working perfectly, but it's hidden away inside a Virtualbox VM.

**Any others** Check any [open issues](https://github.com/WikiLogic/Neo4JProcedures/issues) in our db repo, if there's nothing like it there, open a new one, we want to help! Even if you find a solution, log the issue - it might help someone else.

---


The [one article](https://rominirani.com/docker-tutorial-series-part-7-data-volumes-93073a1b5b72) I found helpful in figuring out volumes.

---

## A Quick guide to the structure of our data

...

---

## Developing Wikilogic Procedures

_Procedures are functions that have been added to Neo4j so that you can call them from the cypher queries._

Currently Procedures can only be written in Java. So this part of the project will require you to set up a local development environment (unless you konw how to set one up through Docker, in which case please PR that!). 

How ever you do it, set up your dev envionment to compile jar files to ./plugins. This folder is copied into the Neo4j docker container so it should pick up the new jar file when you run it.


Set up for developing them.

`docker build -t my-maven -f Dockerfile.dev .` (being worked on - not working yet)

An explanation of each...
