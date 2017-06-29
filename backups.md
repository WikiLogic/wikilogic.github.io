# Backing up the data

## Pulling down a copy manually

 - In production the database container's volume is `/data`
 - connect to the production machine:
    1. `docker-machine env wikilogic`
    2. `eval $(docker-machine env wikilogic)`
 - With docker running copy the data down with `docker-machine scp -r wikilogic:/data ./path/to/wherever` (`./data` will be added to `/whatever`). the second path is on your local relative to wherever you've cd'd into.

## Pushing up data manually

 - connect as above
 - `docker-machine scp -r ./path/to/wherever/data wikilogic:/`

## Automated backups

Currently there are none. This is super high up on the todo list!