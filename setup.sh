#!/bin/sh

# create database
docker-compose exec web rails db:create

# run migrations
docker-compose exec web rails db:migrate

# install webpacker
docker-compose exec web bundle exec rake webpacker:install
