#!/usr/bin/env bash
RAILS_ENV=production rake assets:precompile
RAILS_ENV=production rake db:reset
rails s -e production
