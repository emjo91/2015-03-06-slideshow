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

get "/" do
  erb :index
end

get "/slide/:slide_order" do
  slide = Slide.find(params[:slide_order])
  slide_hash = slide.to_hash
  slide_hash.to_json
end

get "/login" do
  erb :login
end

get "/confirm_login" do
  # Need to have a check for errors, if there isn't an existing user
  # If else redirect for if the user exists or not.
  # IF user exists, redirect to homepage. 
  # ELSE user does not exist, redirect to login again.
end

get "/create_user" do
  # This is working for now....
  @user = User.create(params)
  @user.password = BCrypt::Password.create(params[:password]) 
  @user.save
  redirect "/"
end

# binding.pry