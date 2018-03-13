# frozen_string_literal: true

source "https://rubygems.org"

ruby '~> 2.3.5'

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

gem "sinatra"
gem "thin" # Sinatra recommends to install thin, which Sinatra will recognize if available.

gem "openssl"

gem "activesupport"

group :development do
  gem "pry"
end
