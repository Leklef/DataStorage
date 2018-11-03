require 'resque/tasks'
require 'resque/scheduler/tasks'

task "resque:setup" => :environment

namespace :resque do
  task :setup do
    require 'resque'
    require 'resque-scheduler'
    require 'resque/scheduler'

    if ENV["REDISCLOUD_URL"]
      $redis = Redis.new(url: ENV["REDISCLOUD_URL"])
    end
    Resque.redis = Rails.env.production? ? $redis : "localhost:6379"

    Resque.schedule = YAML.load_file("#{Rails.root}/config/rescue_schedule.yml")
  end

  task :setup_schedule => :setup do
    require 'resque-scheduler'
    Resque.schedule = YAML.load_file("#{Rails.root}/config/rescue_schedule.yml")
  end

  task :scheduler => :setup_schedule
end