def template(from, to)
  erb = File.read(File.expand_path("../templates/#{from}", __FILE__))
  put ERB.new(erb).result(binding), to
end

def set_default(name, *args, &block)
  set(name, *args, &block) unless exists?(name)
end

namespace :deploy do
  desc "Install everything onto the server"
  task :install do
    run "#{sudo} apt-get -y update"
    run "#{sudo} apt-get -y install python-software-properties"
  end

  # For test
  desc "Separated install without all other installs cascading"
  task :python do
    run "#{sudo} apt-get -y update"
    run "#{sudo} apt-get -y install python-software-properties"
  end

  desc "lite deploy: no assets"
  task :lite do
    set :is_lite, true
    default
  end

  # desc "Migrate database"
  # task :migrations do
  #   run "cd #{current_release} && RAILS_ENV=production rake db:migrate"
  # end

  desc "Prepare the app to launch"
  task :setup_admins do
    run "cd #{current_release} && RAILS_ENV=#{rails_env} bundle exec rake setup:admins"
  end
end
