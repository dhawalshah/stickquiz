
# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

# bundler bootstrap
require 'bundler/capistrano'

set :nice_name, "Stickquiz"
set :application, "stickquiz"
#set :domain, "stickquiz.raghavan.info"
#set :repository,  "git@#{domain}:/home/git/repositories/#{application}.git"

role :web, "#{domain}"                          # Your HTTP server, Apache/etc
role :app, "#{domain}"                          # This may be the same as your `Web` server
role :db,  "#{domain}", :primary => true # This is where Rails migrations will run
# # server details
set :default_run_options, {:pty => true}
#set :ssh_options, {:forward_agent => true, :keys => "~/.ec2/alphabet.pem"}
#ssh_options[:keys] = [File.join(ENV["HOME"], ".ssh", "id_rsa")]

set :deploy_to, "/var/www/#{application}/"
set :user, "passenger"
set :use_sudo, false 

# repo details
set :scm, :git
set :scm_username, "manur"
set :repository, "git@github.com:dhawalshah/stickquiz.git"
set :branch, "master"
set :git_enable_submodules, 1
set :rake, "bundle exec rake"

# tasks
namespace :deploy do
  task :start, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end

  task :stop, :roles => :app do
    # Do nothing.
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end

  desc "Symlink shared resources on each release - not used"
  task :symlink_shared, :roles => :app do
    #run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
end

namespace :passenger do
  desc "Restart Application"  
  task :restart do  
    run "touch #{current_path}/tmp/restart.txt"  
  end
end

after :deploy, "passenger:restart"
after "deploy", "deploy:migrate"
after 'deploy:update_code', 'deploy:symlink_shared'

