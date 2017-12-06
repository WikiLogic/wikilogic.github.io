
# Wikilogic Contributor Docs

This site is aimed at those who wish to contribute, or just find out about, the technical side of Wikilogic. For information on why and what it is please refer to [www.wikilogicfoundation.org](http://www.wikilogicfoundation.org/).

---

## Quickstart:

Have [Docker](https://www.docker.com/community-edition) installed, and [Node](https://nodejs.org) if you're looking to work on the front end.

**For Windows:**
 - make a folder somewhere, 
 - copy [wikilogic-setup.bat](https://raw.githubusercontent.com/WikiLogic/wikilogic.github.io/master/wikilogic-setup.bat) into that folder, 
 - run it.
 - [cd](https://www.unixtutorial.org/commands/cd/) into that folder and run docker: `docker-compose up --build` (note you may need to be in the docker for windows terminal)


**For Apple:**
 - Contribute!

_Tip - don't close the docker console, if there are errors while you're developing you'll want to be seeing them as they happen._

The first time you do this it'll take a few minutes and might look like it hangs a few times, give it a little time and if all has gone to plan you now have Wikilogic and all it's dev tooling up and running! You'll know it's time when you see something like this appear in the console that's running docker: 

```
db_1      | Starting Neo4j.
db_1      | Started neo4j (pid 54). It is available at http://127.0.0.1:7474/
arango_1  | 2017-09-14T01:24:36Z [1] INFO {syscall} file-descriptors (nofiles) hard limit is 1048576, soft limit is 1048576
arango_1  | 2017-09-14T01:24:36Z [1] INFO Authentication is turned off, authentication for unix sockets is turned on
api_1     | [nodemon] 1.12.0
arango_1  | 2017-09-14T01:24:38Z [1] INFO using endpoint 'http+tcp://0.0.0.0:8529' for non-encrypted requests
db_1      | There may be a short delay until the server is ready.
db_1      | See /var/lib/neo4j/logs/neo4j.log for current status.
db_1      | Stopping Neo4j.. stopped
db_1      | Starting Neo4j.
db_1      | 2017-09-14 01:24:50.882+0000 INFO  ======== Neo4j 3.0.11 ========
db_1      | 2017-09-14 01:24:51.371+0000 INFO  Starting...
db_1      | 2017-09-14 01:24:52.250+0000 INFO  Bolt enabled on 0.0.0.0:7687.
db_1      | 2017-09-14 01:24:56.546+0000 INFO  Started.c
```

If that all went well:

 - http://localhost/ for the app
 - http://localhost/api for the api (check http://localhost/api/test to see it's running properly)
 - http://localhost:7474 for the db (un & pw are set in the dockerfile)

---

## A quick overview of the architecture

Each box below is a docker container.  
In production mode only the proxy server & static files are accessable.  
In development mode the ports are opened to make life a bit easier.

```
          +---------------+
          |               | You need webpack running to develop the front end
          |   React App   | cd into ./react-app and run `npm start`
          |               | /dist is served by the static/proxy server below
          +---------------+
              |       |
              |       |
             /|       |/api                      The internet
              |       |
==============|=======|=========================================
              |       |
        Static|       |JSON data                  Our server
         Files|       |
              |       |
        +-----|-------|------+
        |     |       |      |
        |   Static / proxy   | server configuration lives in the react-app repo
        |             |      |
        +-------------|------+
                      |
         +------------|----+
         |            |    | There's a test suit set up in the testing repo 
         |   Express API   | cd into /testing and run `npm start` to test
         |                 | 
         +-----------------+
                  |
          +--------------+
          |              | We are in the process of replacing neo with arango
          |   Arangodb   | Arango is less intence on our tight server budget.
          |              |
          +--------------+
```

If you're not comfortable digging into the main codebase, this docs site has [it's own repo](https://github.com/WikiLogic/wikilogic.github.io) and [wikilogicfoundation.org](http://www.wikilogicfoundation.org/) has a repo for it's [WordPress theme](https://github.com/WikiLogic/foundation). Either of which would be less intimidating places to help out.

---

### Problems

**It won't let me sign up / log in**: Currently the API is only set up to allow certain emails to sign up. To add your email to this list on local, go into the API repo/guestlist.js and add your email to the people array. If guestlist.js doesn't exist, use the guestlist-example.js as a template. Note that the 2 test emails are required for the testing to run so they will need to be in your guestlist.js file as well. To help debug you can click on the users collection through the [db interface](http://localhost:8529/_db/wl_dev/_admin/aardvark/index.html#collections) when it's running locally.

**Issues with shared drives**. Go into your settings for docker and enable it.

**File updates not triggering webpack / nodemon**. On Windows or OSX, due to the docker host being inside a Virtualbox VM, FS events are not supported (by Virtualbox). Webpack has been set to polling and nodemon has been set to it's legacy watcher (also polling). Check that these polling options are still set.

**File updates are not being served by nginx**. The production build turns on some caching goodness and nginx's `sendfile`. Turns out `sendfile` doesn't play well with the VM (not sure of the reaons, add them here / link to a stackoverflow if you know!). So these have both been turned off in nginx.dev.conf. Check they're still off.

**Docker won't build** (eg `readdirent: not a directory`): stop the containers, clear out your images, run the build again. If that doesn't work, submit an issue and we'll try and get it worked out.

_Any more problems that you're stuck on, open an issue here https://github.com/WikiLogic/wikilogic.github.io/issues - we want to help! Even if you had a problem which you managed to resolve, we would still welcome an issue - it might help someone else._



 ---

 Hosted by Github built with https://docsify.js.org
