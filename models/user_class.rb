require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt  
  
  # This before filter will come in handy to verify if users are logged in "sessions"
  # Call this method before every "restricted" route
  def current_user
    if session[:user_id]
      @current_user = User.find(sessions[:user_id])
    else 
      redirect "/login"
    end
  end
  
end # end User class