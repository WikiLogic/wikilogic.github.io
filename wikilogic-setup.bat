git clone https://github.com/WikiLogic/react-app.git
git clone https://github.com/WikiLogic/api.git
git clone https://github.com/WikiLogic/Neo4JProcedures.git
git clone https://github.com/WikiLogic/testing.git
git clone https://github.com/WikiLogic/wikilogic.github.io.git

curl https://raw.githubusercontent.com/WikiLogic/wikilogic.github.io/master/docker-compose.dev.yml > docker-compose.dev.yml

(
    echo module.exports = {
    echo     "people": [
    echo        { "email": "you@email.com" },
    echo        { "email": "test@test.com" },
    echo        { "email": "test2@test.com" }
    echo    ]
    echo }
)> "./api/guestlist.js"


( 
    echo {
    echo     "username": "you",
    echo     "password": "yours"
    echo }
)> "./testing/api-credentials.json"

cd api
call npm i
pause