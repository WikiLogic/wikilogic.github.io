## How to get Wikilogic set up manually

Have [git](https://git-scm.com/downloads), [Docker](https://www.docker.com/community-edition), and [Node](https://nodejs.org) installed.

Create a directory for all the wikilogic repos to go into - for those that run the main application they are required to be siblings on your file system. **Proect directory location caveat:** if you're on a mac it should be somewhere under `Users` and if you're on a PC is should be somewhere under `/c/Users/you/`. This is because Docker uses Virtualbox to spin up a linux VM within which the docker magic can run. Virtualbox shares `Users` for OSX and `/c/Users/you/` for Windows by default. Though it is possible to change these if you want. 

This is what you're aiming for:

 - **/wikilogic**
    - **/react-app** (`git clone https://github.com/WikiLogic/react-app.git`)
    - **/api** (`git clone https://github.com/WikiLogic/api.git`)
    - **/Neo4JProcedures** (`git clone https://github.com/WikiLogic/Neo4JProcedures.git`)
    - **/Testing** (`git clone https://github.com/WikiLogic/testing.git`)
    - **/wikilogic.github.io** (`git clone https://github.com/WikiLogic/wikilogic.github.io.git`)

Finally you'll need to download the https://wikilogic.github.io/docker-compose.dev.yml file from this repo and place it in the **/wikilogic** directory.