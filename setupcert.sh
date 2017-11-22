# From the certbot site (nginx on Ubuntu 16.04)
apt-get update
apt-get install software-properties-common
add-apt-repository ppa:certbot/certbot
apt-get update
apt-get install python-certbot-nginx 

# Now to get the certificate
# We give it a directory on the server where it can put a file which will be visible at the site root, this is to confirm we own the domain
# the react app dist folder is shared with the static docker container as a volume so that should be good.
# Note that you will also need the domain to be pointing to this box, DNS changes can take a while so you're going to be without https for a bit
certbot certonly --webroot -w /var/www/wikilogic/react-app/dist -d alpha.wikilogicfoundation.com