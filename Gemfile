source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.4'

gem 'rails', '7.0.4'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'jbuilder', '~> 2.5'
gem 'bcrypt', '~> 3.1.7'

gem 'jquery-rails' # jQueryの導入
gem 'rails-i18n' # 日本語化できるようにする

gem 'mini_racer', platforms: :ruby
gem 'coffee-rails', '~> 4.2'
# gem 'turbolinks', '~> 5'
# gem 'redis', '~> 4.0'

# gem 'mini_magick', '~> 4.8'
# gem 'capistrano-rails', group: :development

gem 'bootstrap', '~> 4.5.0', require: false # bootstrapの導入

gem 'carrierwave'
gem 'mini_magick'
gem 'gretel'
gem 'dotenv-rails' # 環境変数を管理するため


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'debug'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.7.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'seed-fu'
  gem 'solargraph' # コード補完およびコード解析ツール
  gem 'rubocop', require: false # コードスタイルおよびコーディング規約の自動検証を行う静的解析ツール
  gem 'rubocop-rails', require: false #Rails用の静的解析
  gem 'rubocop-performance', require: false # パフォーマンス解析
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
