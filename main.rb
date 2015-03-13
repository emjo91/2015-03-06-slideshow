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

enable  :sessions

get "/" do
  erb :login
end

get "/slides" do
  @user = User.find(session[:user_id])
  @message = "You are logged in as: #{@user.username}"
  erb :index
end


get "/slide/:slide_order" do
  slide = Slide.find(params[:slide_order])
  slide_hash = slide.to_hash
  slide_hash.to_json
end

# I think I will use this for new users rather than existing...in the process of changing it.
get "/login" do
  erb :login
end


# This is finally working.
get "/user_confirm" do
  @user = User.find_by_username(params[:username])
  hashed_password = BCrypt::Password.new(@user.password)
  if hashed_password == params[:password]
    session[:user_id] = @user.id
    # @message = "welcome #{@user.username}"
    redirect "/slides"
  else
    @error = "Sorry, wrong username or password"
    redirect "/login"
  end
end


# This is working.
get "/create_user" do
  @user = User.create(params)
  @user.password = BCrypt::Password.create(params[:password]) 
  @user.save
  session[:user_id] = @user.id
  redirect "/slides"
end

# Fairly certain this works
get "/logout" do
  session[:user_id] = nil
  @message = "We hope to see you again soon!"
  redirect "/"
end

# binding.pry