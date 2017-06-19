# The Front End

Built in React

All data comes from the api.js ...

## How to get it up and running

_Note these instructions are to get you set up with compiling the front end code. If you're looking to get all the contaiers that make up WL running locally check the homepage, we have an easier way to get everything up and running all at once (possbily, still to write that up)_

You will need [git](https://git-scm.com/) & [Docker](https://www.docker.com/) installed.

1. Clone the repo: `git clone https://github.com/WikiLogic/react-app.git`
2. From the repo's root (cd in) run `docker build -f Dockerfile-dev-webpack -t wikilogic_dev_webpack .` (note the `.`, it's important!) This creates an image from which many containers can be spun up, like a blueprint.
3. Start up the container with some options: `docker run -p 8080:8080 -v /c/Users/ijmcc/Projects/Wikilogic/react-app/src:/wldev/src -v /c/Users/ijmcc/Projects/Wikilogic/react-app/dist:/wldev/dist wikilogic_dev_webpack`
    - `-v` maps a directory from the container into your host system in order to save any data you enter in. **It's important to change the above command to match your local set up** as I doubt your username is also "ijmcc". Note that it requires an absolute path, no "./wldev/src" unfortunatly.
4. open [http://localhost:8080](http://localhost:8080) to see your new local version of the Wikilogic app!

---

The proxy server

`docker build -f Dockerfile-dev-proxy -t wikilogic_dev_proxy .`
`docker run -p 80:80 -v /c/Users/ijmcc/Projects/Wikilogic/react-app/dist:/var/www/app wikilogic_dev_proxy`

### Problems

**I need to change the port**: 

 - package.json change the port number in the start script
 - Dockerfile-dev change the port number in the EXPOSE command
 - When you run the `docker run` command, change the ports in there