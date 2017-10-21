# Deploying Wikilogic

## Step 1 - run the production container on your local

 - connect to your local machine:
    1. `docker-machine env default`
    2. `eval $(docker-machine env default)`
 - run build: `docker-compose up --build`
 - open [localhost](http://localhost/) and check your changes

Automated testing is on the todo lis!

## Step 2 - build to production

 - Production code is in:
    - `./root/api`
    - `./root/Neo4JProcedures`
    - `./root/react-app`
 - connect to the production machine:
    1. `docker-machine env wikilogic`
    2. `eval $(docker-machine env wikilogic)`
 - ssh into the server `docker-machine ssh wikilogic`
 - cd into each repo and `git pull`
 - exit the ssh session `exit`
 - run a build `docker-compose up --build -d`

## Getting set up with server credentials

To do - write this up without giving anything sensitive away

## The live server

 - **The root directory**: /var/www/wikilogic - within that is ./api and ./react-app (the two repos with the code needed to run WL in production).
 - **The data**: tbc
 - **The ssl cert**: `/etc/letsencrypt/live/demo.wikilogicfoundation.org/` [certbot](https://certbot.eff.org/docs/) puts a bunch of files in there, the most important are fullchain.pem and privkey.pem. The proxy container has a volume linked from the server's /etc/letsencrypt directory to the container's /root/ssl directory. The nginx config then looks into /root/ssl/live/demo.wikilogicfoundation.org/ for the relevant files

