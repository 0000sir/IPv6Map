#! /bin/bash
bundle exec rake db:migrate
rails s -b 0.0.0.0 -p 3000