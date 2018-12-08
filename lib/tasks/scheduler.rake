desc "This task is called by the Heroku scheduler add-on"
task :update_db => :environment do
  puts "Updating db..."
  DataStorageJob.perform
  puts "done."
end