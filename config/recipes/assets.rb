# This code was taken from http://www.bencurtis.com/2011/12/skipping-asset-compilation-with-capistrano/

set :assets_dependencies, %w(app/assets lib/assets vendor/assets Gemfile.lock config/routes.rb config/environments/production.rb)
set :rake,      "bundle exec rake"
set :asset_env, "RAILS_GROUPS=assets"

namespace :deploy do
  namespace :assets do

    desc "Create assets folder in shared folder"
    task :create_folder, roles: :web do
      run "mkdir #{shared_path}/public/assets"
    end
    after "deploy:setup", "deploy:assets:create_folder"

    desc 'Precompiling assets'
    task :precompile, :roles => :web do
      run "ln -nfs #{shared_path}/public/assets #{release_path}/public/assets"
      run "cd #{current_release} && RAILS_ENV=#{rails_env} bundle exec rake assets:precompile" unless is_lite
    end

  end
end
