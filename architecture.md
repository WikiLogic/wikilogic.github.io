# Architecture

_A quick high level overview of the parts that make up WikiLogic._

Each box below is a docker container.  
In production mode only the proxy server & static files are accessable.  
In development mode the ports are opened to make life a bit easier.

```
          +---------------+
          |               | You need webpack running to develop the front end
          |   React App   | cd into ./react-app and run `npm start`
          |               | /dist is served by the static/proxy server below
          +---------------+
              |       |
              |       |
             /|       |/api                      The internet
              |       |
==============|=======|=========================================
              |       |
        Static|       |JSON data                  Our server
         Files|       |
              |       |
        +-----|-------|------+
        |     |       |      |
        |   Static / proxy   | server configuration lives in the react-app repo
        |             |      |
        +-------------|------+
                      |
         +------------|----+
         |            |    | There's a test suit set up in the testing repo 
         |   Express API   | cd into /testing and run `npm start` to test
         |                 | 
         +-----------------+
                  |
          +--------------+
          |              | We are in the process of replacing neo with arango
          |   Arangodb   | Arango is less intence on our tight server budget.
          |              |
          +--------------+
```