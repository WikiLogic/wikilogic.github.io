# Some helpful docker commands:

Starting it all up for local development:

`docker-compose -f docker-compose.dev.yml up`

---

To clear everything out (good to do on occasion)

 1. Stop all containers <br />`docker stop $(docker ps -a -q)`
 2. Delete all containers <br />`docker rm $(docker ps -a -q)`
 3. Delete all images <br />`docker rmi $(docker images -q)` 

---

Some other commands you may find useful

 - List containers: <br />`docker ps -a`
 - List images: <br />`docker images`
 - Connect to a running container: <br />`docker exec -ti multisite_drupal_1 bash`
 - Start prod containers: <br />`docker-compose up`
 - Stop a specific container <br />`docker stop <container name>`
 - Start a specific container <br />`docker start <container name>`
 - Delete all volumes <br />`docker volume ls -q -f dangling=true` (I'm not sure this applies to wl, we don't yet have any containerized volumes set up)
 
 ---
 
 ## Issues
 
 ### Docker for Windows

 - No data / files in the containers: open the docker for windows settings, a look for the shared drives, C:/ should be checked. (This can happen when you switch between using Windows containers and Linux containers.)
