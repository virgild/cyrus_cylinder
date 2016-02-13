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
gem 'react-rails'
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
bower_dependencies = {
  'normalize.css' => '',
  'bootstrap-sass-official' => '',
  'redux': 'https://cdnjs.cloudflare.com/ajax/libs/redux/3.3.1/redux.js'
}

#
environment 'config.file_watcher = ActiveSupport::EventedFileUpdateChecker', env: 'development'

environment 'config.react.variant = :development', env: 'development'

environment 'config.react.variant = :production', env: 'production'

initializer 'react.rb', <<-CODE
#{app_const}.configure do
  config.react.addons = true
end
CODE

initializer 'warden.rb', <<-CODE
#
CODE

file 'bower.json', <<-CODE
{
  "name": "#{app_name}",
  "version": "1.0.0",
  "authors": [
    "#{name} <#{email}>"
  ],
  "moduleType": [
    "node"
  ],
  "license": "MIT",
  "private": true,
  "ignore": [
    "**/.*",
    "node_modules",
    "bower_components",
    "test",
    "tests"
  ],
  "dependencies": {
    #{bower_dependencies.map { |k, v| "\"#{k}\": \"#{v}\"" }.join(",\n    ")}
  }
}
CODE

file '.bowerrc', <<-CODE
{
  "directory": "vendor/assets/components",
  "analytics": false
}
CODE

#
run 'bower install'
