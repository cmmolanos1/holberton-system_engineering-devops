#!/usr/bin/env bash
#puppet manifest to install a nginx server
exec {'Install nginx':
command  => 'sudo apt update && sudo apt -y install nginx && echo "Holberton School" | sudo tee /var/www/html/index.html && redirect="\\\trewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;\n" && sudo sed -i "37i $redirect" /etc/nginx/sites-enabled/default && sudo service nginx restart',
provider => shell,
}
