require 'resque-scheduler'

redis_url = ENV["REDISCLOUD_URL"]
uri = URI.parse(redis_url.nil? ? "redis://localhost:6379/" : redis_url)
Resque.redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)

Dir["#{Rails.root}/app/jobs/*.rb"].each { |file| require file }
Resque.enqueue_at(24.hours.from_now, DataStorageJob)