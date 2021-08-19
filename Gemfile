source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'

gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'draper'
gem 'dry-matcher'
gem 'dry-validation', '1.6'
gem 'json-api'
gem 'jsonapi-serializer'
gem 'jwt', '~> 2.2'
gem 'jwt_sessions', '~> 2.6'
gem 'pagy'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'pundit'
gem 'rack-cors', '~> 1.1'
gem 'rails', '~> 6.1.4'
gem 'redis', '~> 4.4'
gem 'reform-rails', '~> 0.2'
gem 'simple_endpoint', '~> 1.0.0'
gem 'trailblazer', '~> 2.1'
gem 'trailblazer-rails', '~> 2.1'

group :development, :test do
  gem 'factory_bot_rails', '~> 6.2'
  gem 'ffaker', '~> 2.18'
  gem 'pry-byebug', '~> 3.9'
  gem 'pry-rails', '~> 0.3'
  gem 'rspec-rails', '~> 5.0.0'
  gem 'rubocop', '~> 1.12', require: false
  gem 'rubocop-performance', '~> 1.10', require: false
  gem 'rubocop-rails', '~> 2.9', require: false
  gem 'rubocop-rspec', '~> 2.2', require: false
end

group :development do
  gem 'awesome_print', '~> 1.9'
  gem 'listen', '~> 3.3'
  gem 'spring', '~> 2.1'
end

group :test do
  gem 'database_cleaner', '~> 2.0'
  gem 'dox', '~> 1.3', require: false
  gem 'json_matchers'
  gem 'simplecov', '~> 0.21'
end

gem 'tzinfo-data', '~> 2.0', platforms: %i[mingw mswin x64_mingw jruby]
