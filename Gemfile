source 'https://rubygems.org'

gem 'rails', '4.0.0'

gem 'pg'
gem 'unicorn'
gem 'jquery-rails'
gem 'therubyracer'
gem 'haml-rails'
gem 'bcrypt-ruby', '~> 3.1.1'
gem 'carrierwave'
gem 'carrierwave_backgrounder'
gem 'will_paginate'
gem 'will_paginate-bootstrap'
gem 'font-awesome-rails'
gem 'resque'

#Assets
gem 'coffee-rails', '4.0.0'
gem 'sass-rails',   '4.0.0'
gem 'bootstrap-sass'
gem 'uglifier', '>= 1.0.3'

group :test, :development do
  gem 'factory_girl_rails'
  gem 'rspec-rails'
end

group :development do
  gem 'pry-rails'
  gem 'capistrano'

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
