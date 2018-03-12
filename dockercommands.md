# Some helpful docker commands:

Starting it all up for local development:

`docker-compose up`

---

To clear out unused entities:

* `docker system prune`

_This includes stopped containers. Need to compare this to the series of commands below_

To clear everything out (good to do on occasion for your dev environment)

1.  Stop all containers <br />`docker stop $(docker ps -a -q)`
2.  Delete all containers <br />`docker rm $(docker ps -a -q)`
3.  Delete all images <br />`docker rmi $(docker images -q)`
4.  Remove all volumes <br />`docker volume prune`

---

Some other commands you may find useful

* **Containters**:
  * List:<br />`docker ps -a`
  * Start:<br />`docker start container_tag`
  * Connect & bash:<br />`docker exec -ti container_tag bash`
  * Stop:<br />`docker stop container_tag`
  * Delete:<br />`docker rm container_tag`
* **Images**:
  * List:<br />`docker images`
  * Delete:<br />`docker rmi <tag or ID>`
* **Volumes**
  * list:<br />`docker volume ls`
  * View metadata:<br />`dovker volume inspect volume_name`
  * delete unused:<br />`docker volume prune`
  * delete:<br />`docker volume rm volume_name`
* Delete all volumes <br />`docker volume ls -q -f dangling=true` (I'm not sure this applies to wl, we don't yet have any containerized volumes set up)

---

## Issues

### Docker for Windows

* No data / files in the containers: open the docker for windows settings, a look for the shared drives, C:/ should be checked. (This can happen when you switch between using Windows containers and Linux containers.)
