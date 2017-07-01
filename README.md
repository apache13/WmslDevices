# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

-- export variable RAILS_ENV
$ export RAILS_ENV=production

-- generate secret key
$ rake secret

-- export variable SECRET_KEY_BASE
$ export SECRET_KEY_BASE=<data from rake secret>

-- pre-compile asset
$ rake assets:precompile

-- export variable RAILS_SERVE_STATIC_FILES
$ export RAILS_SERVE_STATIC_FILES=true

-- prepare database
$ rake db:setup
$ rake db:migrate

-- Start server
$ rails s -e production
