# WL is running on an http config file from the react-app repo
# But now the HTTPS cert has been installed, it's time to swap over to the HTTPS config file!

# into the nginx dir of the react-app repo, this has been shared to the proxy container's /etc/nginx dir
cd /var/www/wikilogic/react-app/nginx

# Remane nginx.conf to nginx.old.conf
mv nginx.conf nginx.old.conf

# Rename nginx.https.conf to nginxconf
mv nginx.https.conf nginx.conf

#Now to restart the proxy server, connect to the proxy container and restart nginx!
docker exec -ti wikilogic_proxy_1 bash
nginx -s reload