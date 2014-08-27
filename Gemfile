source 'https://rubygems.org'

gem 'rails', '4.0.0'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'pg'
gem 'devise'
gem 'activeadmin', github: 'activeadmin'
gem 'friendly_id', '~> 5.0.0'# Note: You MUST use 5.0.0 or greater for Rails 4.0+
gem 'mini_magick'
gem 'carrierwave'
gem 'state_machine'
gem 'breadcrumbs_on_rails'
gem 'daemons'
gem 'delayed_job_active_record', '~> 4.0.1'
gem 'prawn', git: 'git://github.com/prawnpdf/prawn.git'
gem 'pg_search'
gem "rails_best_practices"

platforms :rbx do
  gem 'minitest'
  gem 'rubysl'
  gem 'racc'
  gem 'rubinius-coverage', '~> 2.0.1'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 4.0.0'
  gem 'bootstrap-sass', '~> 2.2.2.0'
  gem 'coffee-rails', '~> 4.0.0'
  gem 'jquery-rails'
  gem 'jquery-ui-rails'
  gem 'uglifier', '>= 1.3.0'
  #gem 'meta_search',    '>= 1.1.0.pre'
end

group :test, :development do
  gem 'jazz_hands'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'quiet_assets'
  gem 'rspec-rails', '~> 2.0'
  gem 'capybara'
  gem 'machinist', '>= 2.0.0.beta2'
  gem 'database_cleaner'
  gem 'shoulda-matchers'
  gem 'simplecov', :require => false
  gem 'selenium-webdriver'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
