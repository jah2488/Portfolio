source 'http://rubygems.org'

gem 'rails', '3.1.3'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'redcarpet'
gem 'mongoid-paperclip', :require => "mongoid_paperclip"
gem 'mongoid_slug'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end

# Deploy with Capistrano
gem 'capistrano'

group :test do
  gem 'turn', :require => false
  gem 'cucumber-rails'
  gem 'capybara'
  gem 'launchy'
  gem 'database_cleaner'
end

group :development, :test do
  gem "pry"
  gem "rb-fsevent"
  gem "guard-rspec"
  gem "guard-livereload"
  gem "rspec-rails"
  gem "fabrication"
  gem "shoulda", "~> 2.0.0"
  gem "shoulda-matchers"
  gem "mongoid-rspec"
  gem "capybara"
end
gem "devise"
gem "haml", ">= 3.0.0"
gem "haml-rails"
gem "jquery-rails"
gem "mongoid", "~> 2.4"
gem "bson_ext", "~> 1.5"
