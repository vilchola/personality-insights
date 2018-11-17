# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
5.2.1

* System dependencies

* Configuration

Set this values on local_env.yml
TWITTER_CONSUMER_KEY=YOUR_CONSUMER_KEY
TWITTER_CONSUMER_SECRET=YOUR_CONSUMER_SECRET
TWITTER_ACCESS_TOKEN=YOUR_ACCESS_TOKEN
TWITTER_ACCESS_TOKEN_SECRET=YOUR_ACCESS_TOKEN_SECRET

* Database creation
rails db:migrate

* Deployment instructions (on Heroku)
heroku login
bundle install
heroku create (if it's not created)
git push heroku master
heroku run rake db:migrate
