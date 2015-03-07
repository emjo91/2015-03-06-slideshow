require "sinatra"
require 'json'
require "sqlite3"
require 'pry'

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

### May not need these routes ###
get "/slide/next" do
  #slide = Slide.find(1)
end

get "/slide/previous" do
  # Code here eventually.
end