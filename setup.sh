# This is where the magic happens
mkdir -p "/var/www/wikilogic"

# Jump in there and clone the code
cd /var/www/wikilogic
git clone https://github.com/WikiLogic/api.git
git clone https://github.com/WikiLogic/react-app.git

# The api needs it's node_modules, so...
# cd /var/www/wikilogic/api
# Install npm
# apt-get update
# apt install npm
# Then use it to install the packages required by the api
# npm install

# Back in the main directory, set up docker and run it!
# cd /var/www/wikilogic
# Copy the dockerfile from github
wget -O /var/www/wikilogic/docker-compose.yml https://raw.githubusercontent.com/WikiLogic/wikilogic.github.io/master/docker-compose.yml
# Open the ports to the internet!
sudo ufw allow 80
sudo ufw allow 443

# Turn it on. When you see a few parallel lines like "======>" growing, you're into the docker part.
docker-compose up -d

# TODO: certbot script

# The whole thing can take a few minutes, but when it's done (you should see a few green "done"s) you can open the droplet's IP in any browser and have WL running!