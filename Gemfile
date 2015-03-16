source "http://rubygems.org"
ruby '2.2.0'

gem "sinatra", :git => 'https://github.com/sinatra/sinatra.git'
gem "json"
# gem 'sqlite3', :groups => [:development, :test]
# gem 'pg', :groups => [:production]
gem "sinatra-activerecord"
gem "pry"
gem "bcrypt-ruby"

group :development, :test do
  gem 'sqlite3'
end

group :production do
  gem 'pg'
end