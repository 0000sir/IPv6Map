#! /bin/bash

if [ -f tmp/pids/server.pid ]
then
  rm tmp/pids/server.pid
fi

bundle install
bundle exec rake db:migrate
whenever --update-crontab
rails s -b 0.0.0.0 -p 3000