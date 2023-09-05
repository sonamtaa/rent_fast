# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'

gem 'bootsnap', require: false
gem 'dotenv-rails'
gem 'graphql'
gem 'pagy'
gem 'pg', '~> 1.1'
gem 'puma', '~> 6.3'
gem 'rack-cors'
gem 'rails', '~> 7.0.7'
gem 'search_object'
gem 'search_object_graphql'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'brakeman'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'faker'
  gem 'pry'
  gem 'rubocop', require: false
end

group :test do
  gem 'bundler-audit'
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'guard-rspec', require: false
  gem 'recursive-open-struct'
  gem 'reek'
  gem 'rspec-rails', '~> 6.0.1'
  gem 'rubocop-rspec', require: false
  gem 'rubycritic', require: false
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
  gem 'test-prof'
end
