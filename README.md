
# Wikilogic Contributor Docs

---

Quick reference:

 - Start Dev: `docker-compose -f docker-compose.dev.yml up`

---

This site is aimed at those who wish to contribute, or just find out about, the technical side of Wikilogic. For information on why and what it is please refer to [www.wikilogicfoundation.org](http://www.wikilogicfoundation.org/).

---

## A quick overview of the architecture

We are running several services each inside their own [docker](https://www.docker.com/what-docker) containers:

 - The core is our graph Database: [Neo4j](https://neo4j.com/). Updates are propogated by a few [procedures](http://neo4j.com/docs/developer-manual/current/extending-neo4j/procedures/) written in Java (that's the language of Neo!)
 - This data is exposed to the world through our API, an [Express](https://expressjs.com/) server running on [Node](https://nodejs.org). This is the only container (so far) that can talk to the db container.
 - The UI is a [React](https://facebook.github.io/react/) app served by [Nginx](https://nginx.org) which also acts as a proxy for the API. All web requests come through this service. The plan is to turn this into a load balancer when the time comes.
 - For development the UI code is compiled using [Webpack](https://webpack.js.org/) which lives in a 4th dev only container.

 As an aside, these docs are built with [docsify](https://docsify.js.org) which uses [Vue](https://vuejs.org/) just to throw in another JS framework. And to take it even further, the foundation site runs on [WordPress](https://wordpress.org/) - the theme for that also has [it's own repo](https://github.com/WikiLogic/foundation). So there are plenty of places to get stuck in!

---

## How to get Wikilogic running locally in development mode

You will need [git](https://git-scm.com/downloads) & [Docker](https://www.docker.com/community-edition) installed.

Currently WL requires three repos to be cloned, the database repo, the API server repo and the Front End / proxy server repo. We suggest creating a `wikilogic` directory wherever you usually create projects with one caveat: if you're on a mac it should be somewhere under `Users` and if you're on a PC is should be somewhere under `/c/Users/you/`. This is because Docker uses Virtualbox to spin up a linux VM within which the docker magic can run. Virtualbox shares `Users` for OSX and `/c/Users/you/` for Windows by default. Though it is possible to change these if you want. So this is the project structure you're aiming at:

 - **/wikilogic** (create this directory and cd in)
    - `git clone https://github.com/WikiLogic/react-app.git` (should create a **/react-app** directory with the front end code)
    - `git clone https://github.com/WikiLogic/api.git` (should create an **/api** directory with the api code)
    - `git clone https://github.com/WikiLogic/Neo4JProcedures.git` (should create a **/Neo4JProcedures** directory with the db code)

That's the application code in place. Each repo has it's own Dockerfile(s) that are used to create a container for that service. To run the whole thing with the correct preconfiguration download the https://wikilogic.github.io/docker-compose.dev.yml file from this repo and place it in the **/wikilogic** directory. From there run `docker-compose -f docker-compose.dev.yml up`. The first time you do this it'll take a few minutes and might look like it hangs a few times, give it a little time and you should eventually see something like this: `db_1       | 2017-06-19 00:20:45.619+0000 INFO  Started.` If all has gone to plan you now have Wikilogic and all it's dev tooling up and running!

 - http://localhost/ for the app
 - http://localhost/api for the api (check http://localhost/api/test to see it's running properly)
 - http://localhost:7474 for the db (un neo4j pw neo5j if you're running in dev mode, which you will be if you're following these instructions)

### Problems

**Issues with shared drives**. Go into your settings for docker and enable it.

**File updates not triggering webpack / nodemon**. On Windows or OSX, due to the docker host being inside a Virtualbox VM, FS events are not supported (by Virtualbox). Webpack has been set to polling and nodemon has been set to it's legacy watcher (also polling). Check that these polling options are still set.

**File updates are not being served by nginx**. The production build turns on some caching goodness and nginx's `sendfile`. Turns out `sendfile` doesn't play well with the VM (not sure of the reaons, add them here / link to a stackoverflow if you know!). So these have both been turned off in nginx.dev.conf. Check they're still off.

_Any more problems that you're stuck on, open an issue here https://github.com/WikiLogic/wikilogic.github.io/issues - we want to help! Even if you had a problem which you managed to resolve, we would still welcome an issue - it might help someone else._



 ---

 Hosted by Github built with https://docsify.js.org
