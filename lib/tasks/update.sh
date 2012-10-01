#!/bin/sh

source /usr/local/rvm/scripts/rvm

cd /home/.sites/48/site10/web/current
./bin/rake update_products RAILS_ENV=production