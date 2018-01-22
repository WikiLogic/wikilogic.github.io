
# Wikilogic Contributor Docs

The information here is aimed at those interested in the technical side of Wikilogic. For information on why and what Wikilogic it is please refer to [www.wikilogicfoundation.org](http://www.wikilogicfoundation.org/).

## Quickstart:

Have [Docker](https://www.docker.com/community-edition) installed, and [Node](https://nodejs.org) if you're looking to work on the front end.

**For Windows:**
 - Make a folder somewhere, 
 - Copy [wikilogic-setup.bat](https://raw.githubusercontent.com/WikiLogic/wikilogic.github.io/master/wikilogic-setup.bat) into that folder, 
 - Run wikilogic-setup.bat (double click on it). This will pull down the various repos and set up a few other local configuration files.
 - Open a command line or the docker terminal (depending on your docker installation) in the project folder (the one you created) and run docker: `docker-compose up --build`.
 - Have a cup of tea. The first time you do this it'll take a few minutes and might look like it hangs a few times, give it some time - it's doing quite a lot!

_Tip - don't close the command line / docker terminal when it's running, if there are errors while you're developing they may show up here._

**For Apple:**
 - Contribute!

If that all went well, or even to test if it all went well, try opening the following:

 - http://localhost/ for the app
 - http://localhost/api for the api (check http://localhost/api/test to see it's running properly)
 - http://localhost:7474 for the db (un & pw are set in the dockerfile)

---

## Front end setup

The front end tools run on your local. The code is compiled into a dist directory that is shared with the docker containers.

 - cd into the react-app repo
 - `npm install`
 - `npm start`

---

If you're not comfortable digging into the main codebase, this docs site has [it's own repo](https://github.com/WikiLogic/wikilogic.github.io) and [wikilogicfoundation.org](http://www.wikilogicfoundation.org/) has a repo for it's [WordPress theme](https://github.com/WikiLogic/foundation). We need help with those areas as well!

---

ideas:

2 people disagree - make a bet on if something is correct or not - build something around this. Bet against WL?
