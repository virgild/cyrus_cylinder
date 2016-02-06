gem_group :development do
  gem 'foreman'
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

# Configuration
gem 'dotenv-rails'

# Middleware
gem 'warden'
gem 'geokit-rails', require: false

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
  "normalize.css" => "",
  "bootstrap-sass-official" => ""
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
