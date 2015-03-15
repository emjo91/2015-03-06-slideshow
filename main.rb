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


configure :development do
 set :database, {adapter: "sqlite3", database: "my.db"}
end


enable :sessions

# binding.pry