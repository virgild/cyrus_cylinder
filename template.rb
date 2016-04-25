gem_group :development do
  gem 'annotate'
  gem 'pry-rails'
  gem 'foreman'
  gem 'rack-mini-profiler'
  gem 'quiet_assets'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'awesome_print'

  # Capistrano
  gem 'capistrano-rails'
  gem 'capistrano-sidekiq'
  gem 'capistrano-passenger'
end

gem_group :test do
  gem 'capybara'
  gem 'poltergeist'
  gem 'database_cleaner'
  gem 'codeclimate-test-reporter'
  gem 'timecop'
  gem 'rspec-rails'
  gem 'rspec-activejob'
  gem 'faker'
end

gem_group :development, :test do
  gem 'byebug'
end

# UI
gem 'haml-rails'
gem 'sass-rails'

# Sprockets
gem 'autoprefixer-rails'

# Stores
gem 'dalli'
gem 'oj'
gem 'hiredis'
gem 'redis', require: ['redis', 'redis/connection/hiredis']

# Configuration
gem 'dotenv-rails'

# Middleware
gem 'warden'
gem 'geokit-rails', require: false

# Helpers
gem 'browser'
gem 'kaminari'
gem 'connection_pool'

# Mini-frameworks
gem 'paperclip'
gem 'sidekiq'
gem 'sidekiq-failures'

# Clients
gem 'faraday'

# Oauth
gem 'omniauth-facebook'
gem 'omniauth-twitter'
gem 'omniauth-google-oauth2'

# Services
gem 'aws-sdk-v1', require: false

# Artifact helpers
gem 'whenever', require: false

#
begin
  name = `git config --global --get user.name`.strip
  email = `git config --global --get user.email`.strip
rescue
end

#
environment 'config.file_watcher = ActiveSupport::EventedFileUpdateChecker', env: 'development'

initializer 'warden.rb', <<-CODE
#
CODE
