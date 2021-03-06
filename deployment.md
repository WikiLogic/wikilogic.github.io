# Deploying Wikilogic

This describes the entire setup & deployment process for a new server. It assumes a few things are already in place:

 - You're using Digitalocean and have an account set up (_We also reccomend setting up an ssh key so you can ssh into the server_)
 - You have a domain and access to it's zone files (or some kind of cpanel that will allow you to point it or a subdomain to the new server's IP)

## Creating a server

 - Log into digitaloean and create a new droplet
 - In the "One-click apps" select Docker 
 - Select the smallest droplet and a region near you. 
 - Select the relevant ssh key (hopefully you have one set up already!)
 - Name the droplet (eg 'wikilogic' or 'play')
 - Create! Once it is finished you will be able to see the droplet's IP address. Keep this handy.
 
## Getting WL running on the new droplet

 - copy the [server setup script](https://raw.githubusercontent.com/WikiLogic/wikilogic.github.io/master/setup.sh) into the droplet
    - `wget -O /root/setup.sh https://raw.githubusercontent.com/WikiLogic/wikilogic.github.io/master/setup.sh`
 - run the script 
    - `cd /root`
    - `sh setup.sh` (if it doesn't complete, try running it again)

_The whole thing can take a few minutes, but when it's done (you should see a few green "done"s) you can open the droplet's IP in any browser and have WL running! For details on what that script is doing, open it up - it should be filled with explanatory comments._

## Running WL over HTTPS

 - point your domain to the IP of the droplet running WL
 - wait for the DNS propogation, can take a day or so. You know you're ready when your domain loads WL.
 - When it shows up under your domain...
 - copy the [certbot setup script](https://raw.githubusercontent.com/WikiLogic/wikilogic.github.io/master/setupcert.sh) into the droplet (NOTE you will have to replace our domain name with your own - TODO: turn this into a command line argument)
    - `wget -O /root/setupcert.sh https://raw.githubusercontent.com/WikiLogic/wikilogic.github.io/master/setupcert.sh`
 - run the script
    - `cd /root`
    - `sh setupcert.sh`

_The script installs and runs certbot. You will have to give it a few inputs, mostly "ENTER" and "Y". If successfull you should see a message saying "Congratulations! ...". Your HTTPS certificate should now exist on your droplet in /etc/letsencrypt/live/your.domain.com/. Fortunatly `/etc/letsencrypt/live` has been shared with the docker container so all you need to do now is swap the nginx.config file and restart the proxy server._

 - `wget -O /root/setupswap.sh https://raw.githubusercontent.com/WikiLogic/wikilogic.github.io/master/setupswap.sh`
 - `cd /root`
 - `sh setupswap.sh`
 - Connect to the proxy container `docker exec -ti wikilogic_proxy_1 bash`
 - Reload nginx `nginx -s reload`

TODO: script to swap the nginx config files & setup docker container to handle it.

---

========================== EVERYTHING BELOW IS OLD ==============================

## Set up the HTTPS / SSL cert using certbot

THIS IS A TODO - need to set up a certbot script

Certbot ?updates existing nginx configuration?

_This should be the first thing you set up within the droplet as it's the most problematic._

 - Go to the certbot site and select the relevant install instructions (other on ubuntu 16.04, _not nginx, we've already got our nginx set up - open invite to devops people to update these instructions by the way_)
 - cd / mkdir: `/var/www/wikilogic` (_This is where all the application code is going to live_)
 - to check permissions run `namei -l /var/www/wikilogic`
 - to set run `chmod 0755 wikilogic`
 - run `sudo ufw allow 80` (_This opens up port 80 to the internet_)
 - run `python -m SimpleHTTPServer 80` (_This runs a simple webserver and serves files from the current directory_)
 - `certbot certonly --webroot -w /var/www/wikilogic -d alpha.wikilogicfoundation.com` it will ask for an email and a couple of yes / no questions.


 - Once you have finished running through the install steps you should have nginx running (`service nginx status` will let you know if it is)
 - try pinging the IP from your local. If this doesn't work double check the IP is correct.
 - copy a simple index.html file to `/var/www/html/` and try loading the IP of your droplet in the browser. The html file should load.
 - If everything worked you're ready to point your domain to the droplet's IP. We use alpha.wikilogicfoundation.org. It might take a few minutes but eventually you should see your simple html file loading at your domain.
 - (I also ran `sudo ufw allow 80` but I have not confirmed if that is actually required)
 - run `certbot --nginx`

 - To stop the simple web server, run `fuser -n tcp 80` to get the process listening on 80
 - then run `kill <process number>`


 
## Setting up the HTTPS / SSL certificate with certbot

 - Go to the certbot site and select the relevant install instructions for nginx on ubuntu 16.04 (_note, `python -m SimpleHTTPServer` is a handy way to spin up a really simple web server serving the current directory_)


 - **The ssl cert**: `/etc/letsencrypt/live/demo.wikilogicfoundation.org/` [certbot](https://certbot.eff.org/docs/) puts a bunch of files in there, the most important are fullchain.pem and privkey.pem. The proxy container has a volume linked from the server's /etc/letsencrypt directory to the container's /root/ssl directory. The nginx config then looks into /root/ssl/live/demo.wikilogicfoundation.org/ for the relevant files


---

## Automating deployment

The easiest way to set up a new droplet for wikilogic is to use docker-machine as it will automate the installation of docker on the droplet, but it is also ok to create one manually and install docker yourself.

Digitalocean allows Docker-machine to automate the creation & destruction of droplets through a driver they maintain. Look to their documentation for the most up to date way to do this. In essence: in the digitalocean account generate an access token to use in a docker-machine command. When you run the command an ssh key will be created and stored locally. This is the key that allows the `docker-machine ssh` command access to the newly create droplet.

 - create a droplet: `docker-machine create --driver digitalocean --digitalocean-access-token <your token> wikilogic`
 - list the environments availabel to docker-machine: `docker-machine ls`
 - point docker-machine to an environment by name:
    - Or the new 'wikilogic' droplet 
        1. `docker-machine env wikilogic`
        2. `eval $(docker-machine env wikilogic)`
        3. run `docker-machine ls` to see that 'wikilogic' is now active
    - Eg the default environment (your local)
        1. `docker-machine env default`
        2. `eval $(docker-machine env default)`
        3. run `docker-machine ls` again to see that 'default' is now active
 - connect to the docker environment: `docker-machine ssh wikilogic`
 - exit the ssh session, type `exit`

_Note if docker-machine cannot ssh in, you _