application = 'overheard'
environment =  ENV['RAILS_ENV'] || 'production'
app_path =  "/var/www/overheardby.me"


timeout 30
preload_app true
worker_processes 6

GC.respond_to?(:copy_on_write_friendly=) and GC.copy_on_write_friendly = true




listen "/var/www/overheardby.me/shared/tmp/unicorn.overheardbyme.sock"
# listen 2000


working_directory "/var/www/overheardby.me/current"
pid "/var/www/overheardby.me/shared/pids/unicorn.pid"


stderr_path "/var/www/overheardby.me/shared/log/unicorn.stderr.log"






# Rails breaks unicorn's logger formatting, reset it
# http://rubyforge.org/pipermail/mongrel-unicorn/2010-October/000732.html
Unicorn::Configurator::DEFAULTS[:logger].formatter = Logger::Formatter.new

before_fork do |server, worker|
  ActiveRecord::Base.connection.disconnect! if defined?(ActiveRecord::Base)
end

after_fork do |server, worker|
  ActiveRecord::Base.establish_connection if defined?(ActiveRecord::Base)
end



# Hard-set the CWD & pidfile to ensure app-reloading consistency
# if %w(production staging).include?(environment)
#   working_directory "#{app_path}/current"
#   shared_path = "#{app_path}/shared"
# else
#   working_directory app_path
#   shared_path = app_path
# end
