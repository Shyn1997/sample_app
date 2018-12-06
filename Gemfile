source "https://rubygems.org"
git_source(:github){|repo| "https://github.com/#{repo}.git"}

ruby "2.5.3"

gem "rails", "~> 5.2.1"

gem "bcrypt", "3.1.12"
gem "bootstrap-kaminari-views"
gem "bootstrap-sass", "3.3.7"
gem "carrierwave", "1.2.2"
gem "coffee-rails", "~> 4.2"
gem "config"
gem "faker", "1.7.3"
gem "figaro"
gem "jbuilder", "~> 2.5"
gem "jquery-rails"
gem "kaminari"
gem "mini_magick", "4.7.0"
gem "puma", "~> 3.11"
gem "rubocop", "~> 0.54.0", require: false
gem "sass-rails", "~> 5.0"
gem "sqlite3"
gem "turbolinks", "~> 5"
gem "uglifier", ">= 1.3.0"

gem "rails-i18n"

gem "bootsnap", ">= 1.1.0", require: false

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "web-console", ">= 3.3.0"

  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :production do
  gem "fog", "1.42"
end

group :test do
  gem "capybara", ">= 2.15"
  gem "selenium-webdriver"

  gem "chromedriver-helper"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
