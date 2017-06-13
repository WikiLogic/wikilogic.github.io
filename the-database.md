# The Database (Neo4j)

## How to get it up and running

You will need git & Docker installed.

1. Clone the repo
2. `cd` into the repo
3. `docker build . -t wikilogic_dev_db`
4. (optional) run `docker images` to see that it built
5. `docker run -p 7474:7474 -p 7687:7687 --env NEO4J_AUTH=neo4j/neo5j wikilogic_dev_db` (set whatever password you want in here)
6. open [http://localhost:7474](http://localhost:7474) and log in to see your db!

Some helpful docker commands:

 - List docker images: `docker images`
 - List docker containers: `docker ps -a`
 - Stop container `docker stop <container name>`
 - Start container `docker start <container name>` (give it a few to boot up neo4j)
 - Delete all images `docker rmi $(docker images -q)`
 - Delete all containers `docker rm $(docker ps -a -q)`

---

## A Quick guide to the structure of our data

...

---

## The Wikilogic procedures

Set up for developing them...

An explanation of each...