#!/bin/sh
source /usr/local/rvm/scripts/rvm

# source /usr/local/rvm/scripts/rvm 
cd /home/.sites/48/site10/web/current
bundle exec rake update_products RAILS_ENV=production
