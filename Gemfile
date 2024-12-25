source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.3.4"

# Rails et base de données
gem "rails", "~> 7.1.3"
gem "pg", "~> 1.1"
gem "puma", "~> 6.0"

# Asset pipeline et styles
gem "sprockets-rails"
gem "sassc-rails"
gem "tailwindcss-rails"

# JavaScript et interactivité
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"

# Autres dépendances
gem "redis", "~> 4.0"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false
gem "devise"
gem "faker"

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem 'dotenv-rails'
end

group :development do
  gem "web-console"
end
