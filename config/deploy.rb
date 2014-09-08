require 'bundler/capistrano'
# require 'capistrano-rbenv'
# require 'capistrano/ext/multistage'
#require 'capistrano-unicorn'
#require "whenever/capistrano"

load 'deploy/assets'


puts "####### Starting deploy.rb"


set :ssh_options, {
  config: false
  #Other options...
}

set :scm, :none
set :repository, "."
set :deploy_via, :copy

set :application, "overheard"

set :deploy_to, "/var/www/overheard"
set :shared_path, "/var/www/overheard/shared" 

server "162.243.120.210", :web, :app, :db, :primary => true

set :user, "root"
set :password, "qx2xsze8"
set :group, "root"
set :deploy_to, "/var/www/overheard"
set :shared_path, "/var/www/overheard/shared" 
set :use_sudo, false
set :deploy_via, :copy
set :copy_strategy, :export
set :copy_compression,    :gzip


#set :bundle_cmd, "LANG='en_US.UTF-8' LC_ALL='en_US.UTF-8' RBENV_VERSION='2.1.2' bundle"
set :bundle_flags, "--verbose --binstubs --without development"

# before "deploy:setup", "deploy:install_packages" # Make sure we have latest softwares
# after "deploy:setup", "deploy:setup_permissions"
# after "deploy", "deploy:cleanup" # keep only the last 5 releases

after "deploy", "deploy:migrate"
after "deploy", "deploy:restart"

# after 'deploy', "unicorn:restart"

########### File defaults

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

# role :app, "your app-server here"                          # This may be the same as your `Web` server
# role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
# role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end