require 'resque-scheduler'

if ENV["REDISCLOUD_URL"]
  redis_url = ENV["REDISCLOUD_URL"]
end
uri = URI.parse($redis.nil? ? "redis://localhost:6379/" : redis_url)
Resque.redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)

Dir["#{Rails.root}/app/jobs/*.rb"].each { |file| require file }
Resque.enqueue_at(24.hours.from_now, DataStorageJob)