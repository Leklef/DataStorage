web: bin/rails server -p $PORT -e $RAILS_ENV
resque: TERM_CHILD=1 RESQUE_TERM_TIMEOUT=10 QUEUES=* bundle exec rake resque:work
worker: bundle exec rake resque:work
scheduler: bundle exec rake resque:scheduler