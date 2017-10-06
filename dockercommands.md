 Some helpful docker commands:


 - Start dev containers: <br />`docker-compose -f docker-compose.dev.yml up`
 - Start prod containers: <br />`docker-compose up`
 - Connect to a running container: <br />`docker exec -ti multisite_drupal_1 bash`

 - List containers: <br />`docker ps -a`
 - List images: <br />`docker images`
 - Delete all containers <br />`docker rm $(docker ps -a -q)`
 - Delete all images <br />`docker rmi $(docker images -q)`
 - Delete all volumes <br />`docker volume ls -q -f dangling=true`
 - Stop container <br />`docker stop <container name>`
 - Stop all <br />`docker stop $(docker ps -a -q)`
 - Start container <br />`docker start <container name>`
 
 ---
 
 ## Issues
 
 ### Docker for Windows

 - No data / files in the containers: open the docker for windows settings, a look for the shared drives, C:/ should be checked. (This can happen when you switch between using Windows containers and Linux containers.)
