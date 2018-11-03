require 'resque/tasks'
require 'resque/scheduler/tasks'

task "resque:setup" => :environment

namespace :resque do
  task :setup do
    require 'resque'
    require 'resque-scheduler'
    require 'resque/scheduler'

    redis_url =
    uri = URI.parse(ENV["REDISCLOUD_URL"])
    Resque.redis = Redis.new(uri)

    Resque.schedule = YAML.load_file("#{Rails.root}/config/rescue_schedule.yml")
  end

  task :setup_schedule => :setup do
    require 'resque-scheduler'
    Resque.schedule = YAML.load_file("#{Rails.root}/config/rescue_schedule.yml")
  end

  task :scheduler => :setup_schedule
end