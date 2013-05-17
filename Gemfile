source 'https://rubygems.org'

gem "best_in_place"
# gem 'tesseract-ocr'
gem 'rails-footnotes', '>= 3.7.9', :group => :development
gem 'debugger'
gem 'rails', '3.2.13'
gem 'ruby-units'
gem 'sass-rails'
gem "compass-rails"
gem 'bootstrap-sass'
gem "font-awesome-sass-rails", "~> 3.0.2.2"
gem 'jquery-rails'
gem 'cancan'
gem 'rails_admin'
gem "high_voltage"
gem "nested_form"
gem 'slim', "~> 1.3.8"
gem "devise"

group :assets do
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

group :development do
  gem 'guard'
  gem 'guard-rspec'
  gem 'guard-livereload'
  # gem 'rb-fsevent', '~> 0.9.1' # Guard dependency
end

group :test do
  gem 'capybara-screenshot'
end

group :development, :test do
    gem 'rspec-rails'
    gem 'capybara-webkit'
    gem 'database_cleaner'
    gem 'selenium-webdriver'
    gem "sqlite3-ruby", "~> 1.3.0", :require => "sqlite3"
    gem 'factory_girl_rails'
end

group :production, :staging do
  gem "pg"
end