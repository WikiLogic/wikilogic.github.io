
# Wikilogic Contributor Docs

http://wikilogic.github.io

---

This site is aimed at those who wish to contribute, or just find out about, the technical side of Wikilogic. For information on why and what it is please refer to [www.wikilogicfoundation.org](http://www.wikilogicfoundation.org/).

---

## A quick overview of the architecture

We are running several services each inside their own docker containers:

 - The core is our graph Database: Neo4j. Updates are propogated by a few procedures which you can dig into in the [db repo](https://github.com/WikiLogic/Neo4JProcedures)
 - This data is exposed to the world through our API, an Express server running on Node. This is the only container (so far) that can talk to the db container.
 - The UI is a React app served by Nginx which also acts as a proxy for the API. All web requests come through this service. The plan is to turn this into a load balancer when the time comes.
 - For development the UI code is compiled using Webpack which lives in a 4th dev only container.

 As an aside, these docs are built with docsify which uses Vue just to round our our tech. And to take it even further, the foundation site runs on WordPress - the theme for that is also sitting in a repo under this org. So there are plenty of places to get stuck in!

---

## How to get Wikilogic running locally in development mode

You will need [git](https://git-scm.com/) & [Docker](https://www.docker.com/) installed.

Currently WL requires three repos to be cloned, the database repo, the API server repo and the Front End / proxy server repo. We suggest creating a `wikilogic` directory wherever you usually create projects with one caveat: if you're on a mac it should be somewhere under `Users` and if you're on a PC is should be somewhere under `/c/Users/you/`. This is because Docker uses Virtualbox to spin up a linux VM within which the docker magic can run. Virtualbox shares `Users` for OSX and `/c/Users/you/` for Windows by default. Though it is possible to change these if you want. So this is the project structure you're aiming at:

 - **/wikilogic** (create this directory and cd in)
    - `git clone https://github.com/WikiLogic/react-app.git` (should create a **/react-app** directory with the front end code)
    - `git clone https://github.com/WikiLogic/api.git` (should create an **/api** directory with the api code)
    - `git clone https://github.com/WikiLogic/Neo4JProcedures.git` (should create a **/Neo4JProcedures** directory with the db code)

That's the application code in place. Each repo has it's own Dockerfile(s) that are used to create a container for that service. To run the whole thing with the correct preconfiguration download the https://wikilogic.github.io/docker-compose.dev.yml file from this repo and place it in the **/wikilogic** directory. From there run `docker-compose -f docker-compose.dev.yml up`. The first time you do this it'll take a few minutes and might look like it hangs a few times, give it a little time and you should eventually see something like this: `db_1       | 2017-06-19 00:20:45.619+0000 INFO  Started.` If all has gone to plan you now have Wikilogic and all it's dev tooling up and running!

### Problems

**Issues with shared drives**. Go into your settings for docker and enable it.

**File updates not triggering webpack / nodemon**. On Windows or OSX, due to the docker host being inside a Virtualbox VM, FS events are not supported (by Virtualbox). Webpack has been set to polling and nodemon has been set to it's legacy watcher (also polling). Check that these polling options are still set.

**File updates are not being server by nginx**. The production build turns on some caching goodness and nginx's `sendfile`. Turns out `sendfile` doesn't play well with the VM (not sure of the reaons, add them here / link to a stackoverflow if you know!). So these have both been turned off in nginx.dev.conf. Check they're still off.

---

Some helpful docker commands:

 - List docker images: `docker images`
 - List running containers: `docker ps`
 - List all containers: `docker ps -a`
 - Stop container `docker stop <container name>`
 - Delete all images `docker rmi $(docker images -q)`
 - Delete all containers `docker rm $(docker ps -a -q)`

 ---

 Hosted by Github built with https://docsify.js.org
