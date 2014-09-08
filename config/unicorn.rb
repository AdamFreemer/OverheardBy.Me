# Set the working application directory
# working_directory "/path/to/your/app"
working_directory "/var/www/overheard/current"

# Unicorn PID file location
# pid "/path/to/pids/unicorn.pid"
pid "/var/www/overheard/current/tmp/pids/unicorn.pid"

# Path to logs
# stderr_path "/path/to/log/unicorn.log"
# stdout_path "/path/to/log/unicorn.log"
stderr_path "/var/www/overheard/shared/log/unicorn.log"
stdout_path "/var/www/overheard/shared/log/unicorn.log"

# Unicorn socket
listen "/tmp/unicorn.overheard.sock"
listen "/tmp/unicorn.overheard.sock"

# Number of processes
# worker_processes 4
worker_processes 2

# Time-out
timeout 30
