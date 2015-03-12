require 'Gemfile'
require 'bundler/setup'

require "sinatra"
require "json"
require "sqlite3"
require 'pry'

require "sinatra/activerecord"
set :database, {adapter: "sqlite3", database: "slides.db"}

require_relative 'models/slide_class.rb'
require_relative 'database_setup.rb'

get "/" do
  erb :index
end

get "/slide/:slide_order" do
  slide = Slide.find(params[:slide_order])
  slide_hash = slide.to_hash
  slide_hash.to_json
end

binding.pry