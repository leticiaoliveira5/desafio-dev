source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

gem 'rails', '~> 7.0.1'

gem 'bootsnap', '>= 1.4.4', require: false
gem 'devise', '~> 4.8', '>= 4.8.1'
gem 'jbuilder', '~> 2.7'
gem 'pg', '~> 1.3.5'
gem 'puma', '~> 5.0'
gem 'sass-rails', '>= 6'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'factory_bot_rails', '6.2.0'
  gem 'faker', require: false
  gem 'rspec-rails', '~> 5.1.0'
  gem 'rubocop-rspec', require: false
end

group :test do
  gem 'capybara'
  gem 'shoulda-matchers', '~> 5.0'
  gem 'simplecov', '~> 0.13.0', require: false
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'rubocop-rails', require: false
  gem 'spring'
  gem 'web-console', '>= 4.1.0'
end
