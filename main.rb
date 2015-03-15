require 'rubygems'
require 'bundler/setup'

require "bcrypt"
require "sinatra"
require "json"
require "sqlite3"
require 'pry'

require "sinatra/activerecord"
set :database, {adapter: "sqlite3", database: "slides.db"}

require_relative 'models/slide_class.rb'
require_relative 'models/user_class.rb'
require_relative 'database_setup.rb'

# Controllers
require_relative 'controllers/home.rb'
require_relative 'controllers/login.rb'
require_relative 'controllers/errors.rb'
require_relative 'controllers/slides.rb'
require_relative 'controllers/user_creation.rb'


# Database for development
configure :development do
 set :database, {adapter: "sqlite3", database: "slides.db"}
end


# Database for production
configure :production do
 db = URI.parse(ENV['DATABASE_URL'])
 ActiveRecord::Base.establish_connection(
 :adapter => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
 :host => db.host,
 :username => db.user,
 :password => db.password,
 :database => db.path[1..-1],
 :encoding => 'utf8'
 )
end


enable :sessions

# binding.pry