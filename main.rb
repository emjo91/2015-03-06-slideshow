require "sinatra"
require 'json'
require "sqlite3"
require 'pry'

require_relative 'models/slide_class.rb'
require_relative 'database_setup.rb'

get "/" do
  erb :index
end

get "/slide/:id" do
  
end