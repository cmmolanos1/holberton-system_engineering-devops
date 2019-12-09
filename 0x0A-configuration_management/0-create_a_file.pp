#create a file

file { 'holberton':
  path => 'tmp/holberton',
  mode => '744',
  owner => 'www-data',
  group => 'www-data',
  content => 'I love Puppet',
}