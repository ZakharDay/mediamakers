namespace :rails do  
  desc "Displays the log from the server locally"
  task :log, :roles => :app do
    stream "tail -f #{shared_path}/log/#{rails_env}.log"
  end
end