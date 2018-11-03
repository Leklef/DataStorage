require 'resque-scheduler'

if ENV["REDISCLOUD_URL"]
  $redis = Redis.new(url: ENV["REDISCLOUD_URL"])
end
Resque.redis = Rails.env.production? ? $redis : "localhost:6379"

Dir["#{Rails.root}/app/jobs/*.rb"].each { |file| require file }
Resque.enqueue_at(24.hours.from_now, DataStorageJob)