# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end
set :environment, 'development' 
set :output, "#{path}/log/cron.log"
# Learn more: http://github.com/javan/whenever
# every :sunday, :at => '12pm' do # Use any day of the week or :weekend, :weekday
#   #rake "worker:lower_rating_unsaled_objects"
#   rake "crawle:parse"
# end

every 1.minutes do
  #rake "worker:lower_rating_unsaled_objects"
  rake "crawle:parse", environment: 'development' 
end