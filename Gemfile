source 'https://rubygems.org'

# Declare your gem's dependencies in doorkeeper_sso_client.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

# To use a debugger
# gem 'byebug', group: [:development, :test]

gem 'omniauth-oauth2'
gem 'warden'

group :test do
  gem 'rspec-rails'
  gem 'ffaker'
  gem 'nyan-cat-formatter', github: 'mattsears/nyan-cat-formatter'
  gem 'fabrication'
  gem 'database_cleaner'
  gem 'vcr'
  gem 'webmock'
  gem "shoulda-matchers", require: false
  gem 'simplecov', require: false
  gem 'timecop'
  gem 'combustion', '~> 0.5.3'
end
