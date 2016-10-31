source 'https://rubygems.org'

ruby '2.3.1'

gem 'grape', '~> 0.18.0'
gem 'grape-activerecord', '~> 1.1', '>= 1.1.2'

gem 'rake', '~> 10.4', '>= 10.4.2'

gem 'pry', '~> 0.10.4'
gem 'racksh', '~> 1.0'
gem 'awesome_print', '~> 1.6', '>= 1.6.1'

gem 'foreman', '~> 0.82.0'
gem 'rerun', '~> 0.11.0'

gem 'rack-cors', :require => 'rack/cors'

gem 'bcrypt', '~> 3.1', '>= 3.1.11'

group :development do
  gem 'sqlite3', '~> 1.3', '>= 1.3.11'
end

group :test do
  gem 'rack-test', '~> 0.6.3', require: 'rack/test'
  gem 'rspec', '~> 3.5'
  gem 'shoulda-matchers', '~> 3.1', '>= 3.1.1'
  gem 'database_cleaner', '~> 1.5', '>= 1.5.3'
end

group :production do
  gem 'pg', '0.18.1'
  gem 'rails_12factor', '~> 0.0.3'
end