#Install nginx, setup the index and setup the redirection

package { 'nginx':
  ensure => installed,
  name   => 'nginx',
}

file { '/var/www/html/index.nginx-debian.html':
  path    => '/var/www/html/index.nginx-debian.html',
  content => 'Holberton School',
}

file_line { 'title':
  ensure   => present,
  path     => '/etc/nginx/sites-available/default',
  after    => 'server_name _;',
  line     => 'rewrite ^/redirect_me https://www.youtube.com permanent;',
}

service { 'nginx':
  ensure  => running,
  require => Package['nginx'],
}
