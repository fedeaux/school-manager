source 'https://rubygems.org'

ruby '2.3.1'

gem 'rails', '~> 5.0.0', '>= 5.0.0.1'

# Database
gem 'pg', '~> 0.18'

# Utility
gem 'string-urlize'
gem 'seedbank'

# Modeling
gem 'devise'
gem 'enumerate_it'

# CSS Framework
gem 'therubyracer'
gem 'less-rails-semantic_ui'

# Frontend
gem "bower-rails", "~> 0.10.0"
gem 'coffee-rails', '~> 4.2'
gem 'compass-rails'
gem 'haml-rails'
gem 'slim-rails'
gem 'jquery-rails'
gem 'sass-rails', '~> 5.0'
gem 'sprockets', '~> 3.6.3'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

# REST
gem 'oj' #oj wprks better with rabl :)
gem 'rabl-rails'

# Server
gem 'puma', '~> 3.0'

# Console
gem 'table_print'
gem 'awesome_print'
gem 'text-table'
gem 'pry'

group :development, :test do
  gem 'byebug'
  gem 'capybara'
  gem 'capybara-screenshot'
  gem 'capybara-webkit'
  gem 'database_cleaner', :git => 'git://github.com/bmabey/database_cleaner.git'
  gem 'dotenv-rails'
  gem 'email_spec'
  gem 'factory_girl_rails'
  gem 'rspec-rails'
  gem 'simplecov', :require => false
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller', '~> 0.7.2'
  gem 'listen', '~> 3.0.5'
  gem 'web-console'
end

group :production do
  gem 'rails_12factor'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
