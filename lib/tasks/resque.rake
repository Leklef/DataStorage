require 'resque/tasks'
require 'resque/scheduler/tasks'

task "resque:setup" => :environment

namespace :resque do
  task :setup do
    require 'resque'
    require 'resque-scheduler'
    require 'resque/scheduler'

    if ENV["REDISCLOUD_URL"]
      redis_url = ENV["REDISCLOUD_URL"]
    end
    uri = URI.parse(redis_url.nil? ? "redis://localhost:6379/" : redis_url)
    Resque.redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)

    Resque.schedule = YAML.load_file("#{Rails.root}/config/rescue_schedule.yml")
  end

  task :setup_schedule => :setup do
    require 'resque-scheduler'
    Resque.schedule = YAML.load_file("#{Rails.root}/config/rescue_schedule.yml")
  end

  task :scheduler => :setup_schedule
end