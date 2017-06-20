
# Wikilogic Contributor Docs

http://wikilogic.github.io

---

Quick overview of what WikiLogic is, link to the foundation site for more detail

---

## How to get it up and running

You will need [git](https://git-scm.com/) & [Docker](https://www.docker.com/) installed.

Currently WL requires three repos to be cloned, the database repo, the API server repo and the Front End / proxy server repo. We suggest creating a `wikilogic` directory wherever you usually create projects with one caveat: if you're on a mac it should be somewhere under `Users` and if you're on a PC is should be somewhere under `/c/Users/you/`. The reason is to do with VirtualBox, volumes, and permissions... we'll get to that! This is what you're aiming for:

 - **/wikilogic** (create this directory and cd in)
    - `git clone https://github.com/WikiLogic/react-app.git` (should create a **/react-app** directory with the front end code)
    - `git clone https://github.com/WikiLogic/api.git` (should create an **/api** directory with the api code)
    - `git clone https://github.com/WikiLogic/Neo4JProcedures.git` (should create a **/Neo4JProcedures** directory with the db code)

One last thing to get, download the https://wikilogic.github.io/docker-compose.dev.yml file from this repo and place it in the **/wikilogic** directory.

_TODO: automate the above_

Now you have all the code, you're ready to boot it all up! From the **/wikilogic** directory run `docker-compose -f docker-compose.dev.yml up`. The first time you do this it'll take a few minutes and might look like it hangs a few times, give it a little time and you should eventually see some logging beginning with `db_1` / `webpack_1` / `api_1`. when you see something like this: `db_1       | 2017-06-19 00:20:45.619+0000 INFO  Started.` you should be good to go!
_Note1: If you have an issue about shared drives, go into your settings for docker and enable it_

_Note2: due to some weird virtualbox / volume / docker bug files from your host system that are shared with the containers may not update properly. We are activley working on this issue - if you have any insight, let us know!_

Some helpful docker commands:

 - List docker images: `docker images`
 - List running containers: `docker ps`
 - List all containers: `docker ps -a`
 - Stop container `docker stop <container name>`
 - Delete all images `docker rmi $(docker images -q)`
 - Delete all containers `docker rm $(docker ps -a -q)`

 ---

 Hosted by Github built with https://docsify.js.org
