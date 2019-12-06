# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

# Environment variable setup
gem 'dotenv-rails'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.0.rc1'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 3.12'
# Use SCSS for stylesheets
gem 'sassc'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'rspec-rails', '~> 3.5'
  gem 'rspec_junit_formatter'

  # Fast creation of test objects
  gem 'factory_bot_rails'
  gem 'ffaker'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  # better errors for debugging
  gem 'better_errors'
  gem 'binding_of_caller'

  # Pry for debugging goodness
  gem 'pry-rails'

  # All them rules for development
  gem 'rubocop'
  gem 'rubocop-performance'
  gem 'rubocop-rspec'

  gem 'bullet'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'

  gem 'rails-controller-testing' # If you are using Rails 5.x

  gem 'database_cleaner'
  gem 'shoulda-matchers'

  # Allows us to create a fake API
  gem 'vcr'
  gem 'webmock'

  # Simple Cov
  gem 'coveralls', require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# To get badge information
gem 'google-api-client', '~> 0.11'

# Slim for clean HTML
gem 'slim'

# Pretty things!
# Bootstrap and JQuery for Bootstrap!
gem 'font-awesome-sass'
gem 'sassc-rails'

# Required for rails 6.1 (recommeneded 1.2)
gem 'image_processing'

# User management gems
gem 'devise'
gem 'omniauth'
gem 'omniauth-google-oauth2'
gem 'pundit'
gem 'rolify'

# High Voltage for static web pages (login screen)
gem 'high_voltage', '~> 3.1'

# Simple forms
gem 'simple_form'

# Amazon web servicess
gem 'aws-sdk-rails'