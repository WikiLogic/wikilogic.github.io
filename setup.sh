
mkdir -p /var/www/wikilogic
cd /var/www/wikilogic

git clone https://github.com/WikiLogic/api.git
git clone https://github.com/WikiLogic/react-app.git

scp https://raw.githubusercontent.com/WikiLogic/wikilogic.github.io/master/docker-compose.dev.yml docker-compose.dev.yml

(cd api && npm install)

sudo ufw allow 80

docker-compose -f docker-compose.dev.yml up -d