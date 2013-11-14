require 'bundler/capistrano'
load 'deploy/assets'

ssh_options[:forward_agent] = true
set :user, "root"
set :password, "mWmWN2C1"
server "37.200.65.209", :app, :web, :db, :primary => true

set :application, "home_info"
set :deploy_to, "/home/www/#{application}"
set :keep_releases, 2

default_run_options[:pty] = true 
set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
set :repository, "https://github.com/rokkit/build-info.git"
set :branch, "master"
set :deploy_via, :checkout


# if you want to clean up old releases on each deploy uncomment this:
 after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
set :bundle_flags, "--quiet --binstubs --shebang ruby-local-exec"
set :default_environment, {
  'RBENV_ROOT' => "$HOME/.rbenv/",
  'PATH' => "$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH"
}
after :deploy do
  run "#{try_sudo} chmod 777 -R #{current_path}/log"
  run "#{try_sudo} chmod 777 -R #{current_path}/tmp"
  run "#{try_sudo} chmod 777 -R #{current_path}/public"
end

task :link_shared_directories do     
  run "ln -s #{shared_path}/files/ #{release_path}/public"   
  # run "ln -s /home/www/home_info/shared/files/ public"
end    

after "deploy:update_code", :link_shared_directories



namespace :deploy do
  namespace :assets do
    task :precompile, :roles => :web, :except => { :no_release => true } do
      from = source.next_revision(current_revision)
      if capture("cd #{latest_release} && #{source.local.log(from)} vendor/assets/ app/assets/ | wc -l").to_i > 0
        run %Q{cd #{latest_release} && #{rake} RAILS_ENV=#{rails_env} #{asset_env} assets:precompile}
      else
        logger.info "Skipping asset pre-compilation because there were no asset changes"
      end
    end
  end
end
