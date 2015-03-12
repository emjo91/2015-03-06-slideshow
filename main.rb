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


# Not returning correct info, even when the password is infact correct.
# Y U KEEP RETURNING FALSE?? 
get "/user_confirm" do
    @user = User.find_by_username(params[:username])
    hashed_password = BCrypt::Password.create(@user.password)
    binding.pry
    if hashed_password == params[:password]
      redirect "/"
    else
      redirect "/login"
    end
end


get "/create_user" do
  # This is working for now....
  @user = User.create(params)
  @user.password = BCrypt::Password.create(params[:password]) 
  @user.save
  redirect "/"
end

# binding.pry