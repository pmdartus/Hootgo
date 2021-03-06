source 'https://rubygems.org'

# ruby on rails framework
gem 'rails', '~>4.0.2'

# Webserver
gem 'unicorn'

# Database
gem 'sqlite3', group: [:development, :test]
gem 'pg', group: [:production]

group :development, :test do
  gem 'better_errors'
  gem 'rspec-rails', '~> 3.0.0.beta'
  gem 'shoulda-matchers'
  gem 'factory_girl_rails'
end

# Runtime Js
gem 'therubyracer'

# Assets
gem 'sass-rails', '~> 4.0.0'
gem 'less-rails-bootstrap', '~> 3.0.4'
gem 'uglifier', '~> 2.2.1'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails', '~> 3.0.4'

# Turbolinks makes following links in your web application faster.
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.5.2'

# Background job
gem 'resque', :require => 'resque/server'

# Users account management
gem 'devise', '~> 3.1.1'
gem 'omniauth', '~> 1.1.4'
gem 'omniauth-facebook', '~> 1.4.1'
gem 'omniauth-twitter', '~> 1.0.1'

# Stripe API integration
# gem 'stripe'

# Gengo API integration
gem "json", "= 1.8.0"
gem 'gengo'

# Heroku gem for plugins
gem 'rails_12factor', group: :production

ruby "2.0.0"