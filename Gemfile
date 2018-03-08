# frozen_string_literal: true

source "https://rubygems.org"

ruby '~> 2.3.5'

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

gem "sinatra"
#gem "thin" # It is recommended to also run gem install thin, which Sinatra will pick up if available.
gem "unicorn"

group :development do
  gem "pry"
end
