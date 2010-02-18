set :application, "boxutca"
set :repository, "ssh://zoner@eperpalanta.hu/home/git/repositories/boxutca.git"
ssh_options[:paranoid] = false
default_run_options[:pty] = true
set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
role :web, "hanzo.hu"
role :app, "hanzo.hu"
role :db, "hanzo.hu", :primary => true
set :deploy_to, "/srv/www/boxutca.com/htdocs"

set :user, "boxutca"
set :runner, "boxutca"
set :use_sudo, false
set :deploy_via, :remote_cache


# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end