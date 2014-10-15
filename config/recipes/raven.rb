namespace :raven do
  desc "Send test error to Sentry"
  task :check do
    run "cd #{current_release} && RAILS_ENV=#{rails_env} bundle exec rake raven:test"
  end
end
