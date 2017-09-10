
# Wikilogic Contributor Docs

---

Quick reference:

 - Start Dev: `docker-compose -f docker-compose.dev.yml up`
 
---

This site is aimed at those who wish to contribute, or just find out about, the technical side of Wikilogic. For information on why and what it is please refer to [www.wikilogicfoundation.org](http://www.wikilogicfoundation.org/).

---

## A quick overview of the architecture

Each box below is a docker container.  
In production mode only the proxy server & static files are accessable.  
In development mode the ports are opened to make life a bit easier.

```
          +---------------+
          |               | To develop: cd into the repo and run `npm start`
          |   React App   | /src is compiled into /dist by webpack
          |               | /dist is served by the static/proxy server below
          +---------------+
                  |
        +--------------------+
        |                    |
        |   Static / proxy   | nginx.conf files for this are in the react-app repo
        |                    |
        +--------------------+
                  |
         +-----------------+
         |                 | In development mode this is run by nodemon so just start typig!
         |   Express API   | cd into the test repo and run `npm start` to run the api
         |                 | test suit.
         +-----------------+
            |           |
 +--------------+   +--------------+
 |              |   |              | We are in the process of replacing neo with arango
 |   Neo4j db   |   |   Arangodb   |
 |              |   |              |
 +--------------+   +--------------+
```

This docs site has [it's own repo](https://github.com/WikiLogic/wikilogic.github.io), update the markdown files and push to update this site.

The [wikilogicfoundation.org](http://www.wikilogicfoundation.org/) site runs on WordPress and the theme has [it's own repo](https://github.com/WikiLogic/foundation) too.

So there are plenty of places to get stuck in!

---

## How to get Wikilogic running locally in development mode

Have [git](https://git-scm.com/downloads), [Docker](https://www.docker.com/community-edition), and [Node](https://nodejs.org) installed.

Create a directory for all the wikilogic repos to go into - for those that run the main application they are required to be siblings on your file system. **Proect directory location caveat:** if you're on a mac it should be somewhere under `Users` and if you're on a PC is should be somewhere under `/c/Users/you/`. This is because Docker uses Virtualbox to spin up a linux VM within which the docker magic can run. Virtualbox shares `Users` for OSX and `/c/Users/you/` for Windows by default. Though it is possible to change these if you want. 

This is what you're aiming for:

 - **/wikilogic**
    - **/react-app** (`git clone https://github.com/WikiLogic/react-app.git`)
    - **/api** (`git clone https://github.com/WikiLogic/api.git`)
    - **/Neo4JProcedures** (`git clone https://github.com/WikiLogic/Neo4JProcedures.git`)
    - **/Testing** (`git clone https://github.com/WikiLogic/testing.git`)
    - **/wikilogic.github.io** (`git clone https://github.com/WikiLogic/wikilogic.github.io.git`)

To run everything in Docker download the https://wikilogic.github.io/docker-compose.dev.yml file from this repo and place it in the **/wikilogic** directory. Now run the command at the very top of this page!

The first time you do this it'll take a few minutes and might look like it hangs a few times, give it a little time and if all has gone to plan you now have Wikilogic and all it's dev tooling up and running! You'll know it's time when you see something like this appear in the console that's running docker: 
```
db_1       | 2017-06-19 00:20:45.619+0000 INFO  Started.
```

_Tip - don't close the docker console, if there are errors while you're developing you'll want to be seeing them as they happen._

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
