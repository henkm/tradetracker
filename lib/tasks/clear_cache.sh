#!/bin/bash

source /usr/local/rvm/scripts/rvm

cd /home/.sites/48/site10/web/current
bundle exec rake tmp:clear RAILS_ENV=production
