require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt  
  
  # # Will determine if a user's password is legit or not.
  # # Fairly certain this does not go here.
  # def authenticate
  #   @user = User.find_by_email(params[:email])
  #   if @user.password == params[:password]
  #     give_token
  #   else
  #     redirect_to home_url
  #   end
  # end
  #
  # # Not sure what to use this for.
  # def password
  #   @password ||= Password.new(password_hash)
  # end
  #
  # # Not sure what to use this for...
  # def password=(new_password)
  #   @password = Password.create(new_password)
  #   self.password_hash = @password
  # end
  
end # end User class