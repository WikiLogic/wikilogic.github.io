git clone https://github.com/WikiLogic/react-app.git
git clone https://github.com/WikiLogic/api.git
git clone https://github.com/WikiLogic/Neo4JProcedures.git
git clone https://github.com/WikiLogic/testing.git
git clone https://github.com/WikiLogic/wikilogic.github.io.git

curl https://raw.githubusercontent.com/WikiLogic/wikilogic.github.io/master/docker-compose.dev.yml > docker-compose.dev.yml

cd api
call npm i
pause