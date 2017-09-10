# Backing up the data

## Pulling down a copy manually

 - In production the database container's volume is `/data`
 - connect to the production machine:
    1. `docker-machine env wikilogic`
    2. `eval $(docker-machine env wikilogic)`
 - With docker running copy the data down with `docker-machine scp -r wikilogic:/data ./path/to/wherever` (`./data` will be added to `/whatever`). the second path is on your local relative to wherever you've cd'd into.

## Pushing up data manually

 - connect as above
 - copy the data up `docker-machine scp -r ./data wikilogic:/`
 - restart? `docker-compose up -d` Seems like the container needs to restert for data updates to take effect. bu just doing a build doesn't always do it. So far the only way I've figured out is to ssh on, stop the container, exit and run `docker-compose up -d`

## Automated backups

Currently there are none. This is super high up on the todo list!