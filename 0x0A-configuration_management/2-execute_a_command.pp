# Kill a process

exec { 'restart_process':
  command  => 'pkill -f killmenow',
  provider => 'shell',
}