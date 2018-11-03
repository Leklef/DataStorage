require 'resque/tasks'
require 'resque/scheduler/tasks'

task "resque:setup" => :environment

namespace :resque do
  task :setup do
    require 'resque'
    require 'resque-scheduler'
    require 'resque/scheduler'

    uri = URI.parse(ENV["REDISCLOUD_URL"] || "redis://localhost:6379/")
    Resque.redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)

    Resque.schedule = YAML.load_file("#{Rails.root}/config/rescue_schedule.yml")
  end

  task :setup_schedule => :setup do
    require 'resque-scheduler'
    Resque.schedule = YAML.load_file("#{Rails.root}/config/rescue_schedule.yml")
  end

  task :scheduler => :setup_schedule
end