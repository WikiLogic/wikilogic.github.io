# This is where the magic happens
mkdir -p "/var/www/wikilogic"

# Jump in there and clone the code
cd /var/www
git clone --recursive https://github.com/WikiLogic/infrastructure.git wikilogic

# Open the ports to the internet!
sudo ufw allow 80
sudo ufw allow 443

# Turn it on. When you see a few parallel lines like "======>" growing, you're into the docker part.
cd /var/www/wikilogic
docker-compose up -d

# TODO: certbot script

# The whole thing can take a few minutes, but when it's done (you should see a few green "done"s) you can open the droplet's IP in any browser and have WL running!
