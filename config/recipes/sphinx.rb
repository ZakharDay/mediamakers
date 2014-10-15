namespace :sphinx do
  desc "Install Sphinx"
  task :install do
    run "#{sudo} apt-get -y install python-sphinx"
  end

  desc "Sphinx index"
  task :rebuild do
    run "cd #{current_release} && RAILS_ENV=#{rails_env} rake ts:rebuild"
  end

  desc "Sphinx index"
  task :index do
    run "cd #{current_release} && RAILS_ENV=#{rails_env} rake ts:index"
  end

  desc "Sphinx restart"
  task :restart do
    run "cd #{current_release} && RAILS_ENV=#{rails_env} rake ts:restart"
  end

  # after 'deploy:update_code', 'sphinx:rebuild'
  # after 'deploy:update_code', 'sphinx:index'
  # after 'deploy:update_code', 'sphinx:restart'
end
