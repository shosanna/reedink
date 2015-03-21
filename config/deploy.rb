# config valid only for current version of Capistrano
lock "3.3.5"

set :default_environment, {
  "PATH" => "$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH"
}

set :application, "reedink"
set :repo_url, "git@github.com:shosanna/reedink.git"

set :deploy_to, "/opt/apps/reedink-rails"

# Default value for :pty is false
# set :pty, true

set :linked_files, %w{config/database.yml config/unicorn.rb config/secrets.yml config/initializers/trackets.rb}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets}

set :rbenv_type, :user
set :rbenv_ruby, "2.2.1"
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby rails}
set :rbenv_roles, :all # default value

# Default value for keep_releases is 5
set :keep_releases, 20

set :rails_env, "production"

namespace :deploy do
  desc 'Start application'
  task :start do
    on roles(:app), in: :sequence, wait: 5 do
      within current_path do
        execute :bundle, "exec unicorn -D -c config/unicorn.rb -E #{fetch(:rails_env)}"
      end
    end
  end

  desc 'Stop application'
  task :stop do
    on roles(:app), in: :sequence, wait: 5 do
      within current_path do
        execute :echo, " && [ -f tmp/pids/unicorn.pid ] && kill $(cat tmp/pids/unicorn.pid) || true"
      end
    end
  end

  task :restart do
    invoke "deploy:stop"
    invoke "deploy:start"
  end

  after :publishing, "deploy:restart"
  after :finishing, "deploy:cleanup"
end

require "./config/boot"
