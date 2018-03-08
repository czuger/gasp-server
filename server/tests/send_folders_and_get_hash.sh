#!/usr/bin/env bash

pkill -f gasp-background-server

RAILS_ENV=development /home/ced/.rbenv/shims/bundle exec ruby server/gasp-background-server.rb &

RAILS_ENV=development /home/ced/.rbenv/shims/bundle exec ruby server/tests/fake_client.rb