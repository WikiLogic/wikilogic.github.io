- [Home](/)
- [The Front End](the-front-end.md)
- [The API](the-api.md)
- [The Database](the-database.md)
    - [Data Backups](backups.md)
- [Deployment](deployment.md)

---

Some helpful docker commands:

 - List images: `docker images`
 - List running containers: `docker ps`
 - List all containers: `docker ps -a`
 - Stop container `docker stop <container name>`
 - Start container `docker start <container name>`
 - Delete all images `docker rmi $(docker images -q)`
 - Delete all containers `docker rm $(docker ps -a -q)`
