#Install nginx, setup the index and setup the redirection

package { 'install nginx':
  ensure => 'installed',
  name   => 'nginx',
}

file { 'modify index':
  path    => '/var/www/html/index.nginx-debian.html',
  content => 'Holberton School',
}

file_line { 'add the redirection in config file':
    ensure => 'present',
    after  => 'server_name _;',
    path   => '/etc/nginx/sites-available/default',
    line   => '\\\trewrite ^/redirect_me https://www.youtube.com/ permanent;',
}

service {'start nginx':
    ensure  => running,
    require => Package['nginx'],
}
