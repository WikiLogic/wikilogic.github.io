#This is where the magic happens
mkdir -p "/var/www/wikilogic"

#Jump in there and clone the code
cd /var/www/wikilogic
git clone https://github.com/WikiLogic/api.git
git clone https://github.com/WikiLogic/react-app.git

#the api needs it's node_modules, so install npm and install the api packages
cd /var/www/wikilogic/api
apt-get update
apt install npm
npm install

#back in the main directory, set up docker and run it!
cd /var/www/wikilogic
wget -O /var/www/wikilogic/docker-compose.yml https://raw.githubusercontent.com/WikiLogic/wikilogic.github.io/master/docker-compose.yml
sudo ufw allow 80
docker-compose up -d