source 'https://rubygems.org'

gem 'deep_cloneable', git: "git@github.com:moiristo/deep_cloneable.git", branch: 'rails2.x-3.0'

gem "best_in_place"
# gem "angular-rails"
gem 'tesseract-ocr'
gem 'rails-footnotes', '>= 3.7.9', :group => :development
gem 'debugger'
gem 'rails', '3.2.13'
gem 'ruby-units'
# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

group :production, :staging do
  gem "pg"
end

group :development, :test do
  gem "sqlite3-ruby", "~> 1.3.0", :require => "sqlite3"
end


gem 'slim', "~> 1.3.8"

group :development, :test do
    # gem 'railroady' # generates association diagrams 
    # gem 'steak'
    gem 'rspec-rails'
    gem 'capybara'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  # gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  # gem 'bootstrap-sass', '~> 2.3.1.0'
  

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'sass-rails'
gem "compass-rails"
gem 'bootstrap-sass'
gem "font-awesome-sass-rails", "~> 3.0.2.2"
gem 'jquery-rails'
gem 'cancan'
gem 'rails_admin'
gem "high_voltage"
gem "nested_form"

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'


gem "devise"