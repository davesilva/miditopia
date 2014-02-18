source 'https://rubygems.org'

gem 'rails', '3.2.13'

gem 'pg'
gem 'unicorn'
gem 'jquery-rails'
gem 'therubyracer'
gem 'haml-rails'
gem 'bcrypt-ruby', '~> 3.0.0'
gem 'carrierwave'
gem 'carrierwave_backgrounder'
gem 'will_paginate'
gem 'will_paginate-bootstrap'
gem 'font-awesome-rails'
gem 'resque'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'coffee-rails'
  gem 'sass-rails',   '~> 3.2.3'
  gem 'bootstrap-sass'

  gem 'uglifier', '>= 1.0.3'
end

group :test, :development do
  gem 'factory_girl_rails'
  gem 'rspec-rails'
end

group :development do
  gem 'pry-rails'

  gem 'guard'
  gem 'rb-inotify', :require => false
  gem 'rb-fsevent', :require => false
  gem 'rb-fchange', :require => false
  gem 'libnotify' if /linux/ =~ RUBY_PLATFORM
  gem 'growl' if /darwin/ =~ RUBY_PLATFORM
  gem 'terminal-notifier-guard' if /darwin/ =~ RUBY_PLATFORM

  gem 'guard-livereload'
  gem 'rack-livereload'
  gem 'guard-rails'
  gem 'guard-rspec'
  gem 'guard-bundler'
  gem 'guard-resque'
  gem 'guard-zeus'
end
