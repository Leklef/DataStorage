require 'resque-scheduler'

uri = URI.parse(ENV["REDISCLOUD_URL"] || "redis://localhost:6379/")
Resque.redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)

Dir["#{Rails.root}/app/jobs/*.rb"].each { |file| require file }
Resque.enqueue_at(1.minutes.from_now, DataStorageJob)