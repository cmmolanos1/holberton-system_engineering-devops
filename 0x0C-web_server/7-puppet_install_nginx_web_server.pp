#!/usr/bin/env bash
#Install nginx

exec {'Install nginx':
  command  => 'sudo apt-get -y update && sudo apt-get -y install nginx',
  provider => shell,
}

exec {'Modify index':
  command  => 'echo "Holberton School" > /var/www/html/index.nginx-debian.html',
  provider => shell,
}

exec {'Modify configuration':
  command  => 'new_string="\\\trewrite ^/redirect_me https://www.youtube.com/ permanent;" && sudo sed -i "42i $new_string" /etc/nginx/sites-available/default',
  provider => shell,
}

exec {'Restart the server':
  command  => 'sudo service nginx start',
  provider => shell,
}
