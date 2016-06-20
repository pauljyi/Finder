source 'https://rubygems.org'

# User Login Gem
gem 'devise'

# Adding Images To Models/DB
gem 'paperclip'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.4'
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'geokit-rails'
gem 'geokit'
# Use jquery as the JavaScript library
gem 'jquery-rails'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use Gon to easily pass data to JavaScript
gem 'gon'
# Use geocomplete_rails for Geocoding and Autocomplete
gem 'geocomplete_rails', '~> 1.6', '>= 1.6.5'

#User geocoder to validate addresses
gem 'geocoder'

#Use jQuery-turbolinks to resolve google map api conflicts with Turbolinks
gem 'jquery-turbolinks'

#Textacular exposes full text search capabilities from PostgreSQL, extending ActiveRecord with scopes making search easy and fun!
gem 'textacular', "~> 3.0", require: 'textacular/rails'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

  gem 'google-api-client', :require => 'google/api_client'
  gem 'omniauth'
  gem 'omniauth-oauth2', '~> 1.3.1'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'capybara'
  gem 'better_errors'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  gem 'rspec-rails', '~> 3.0'
  gem 'factory_girl_rails'
  gem 'simplecov', :require => false, :group => :test

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :test do
  gem 'shoulda-matchers'
end
