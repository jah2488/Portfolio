$:.unshift(File.expand_path('./lib', ENV['rvm_path'])) # Add RVM's lib directory to the load path.
require "rvm/capistrano"                  # Load RVM's capistrano plugin.
require "bundler/capistrano"
load 'deploy/assets'

# set :rvm_ruby_string, 'ruby-1.9.2'        # Or whatever env you want it to run in.

set :application, "portfolio"

role :web, "50.56.221.224"                          # Your HTTP server, Apache/etc
role :app, "50.56.221.224"                          # This may be the same as your `Web` server
role :db,  "50.56.221.224", :primary => true # This is where Rails migrations will run

set :scm, "git"

set  :bundle_without, [:test, :development]
set  :rails_env, "production"

#set  :deploy_via, :remote_cache
set  :deploy_to, "/var/www/#{application}"

ssh_options[:forward_agent] = true
default_run_options[:pty] = true  # Must be set for the password prompt from git to work

set :repository, "git@github.com:jah2488/Portfolio.git"  # Your clone URL
set :branch, "master"
set :scm_verbose, true
set :use_sudo, true
set :user, "deployer"  # The server's user for deploys
set :scm_passphrase, "dont forget this"  # The deploy user's password

%w[stop start reload].each do |command|
  desc "#{command} nginx"
  task command, roles: :web do
    run "#{sudo} /opt/nginx/sbin/nginx -s #{command}"
  end
end

after :deploy, :reload
