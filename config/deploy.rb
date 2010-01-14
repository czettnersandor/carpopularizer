set :application, "boxutca"
set :repository, "git@eperpalanta.hu:boxutca.git"
set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :deploy_via, :remote_cache
role :web, "boxutca.eperpalanta.hu"
role :app, "boxutca.eperpalanta.hu"
role :db, "boxutca.eperpalanta.hu", :primary => true
set :deploy_to, "/var/customers/eper/#{application}"

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