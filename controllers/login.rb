# Main user login page #This doesn't actually do anything...
get "/login" do
  erb :"login/login"
end

# This verifies the user
post "/user_confirm" do
  @user = User.find_by_username(params[:username])
  hashed_password = BCrypt::Password.new(@user.password)
  if hashed_password == params[:password]
    session[:user_id] = @user.id
    # @message = "welcome #{@user.username}"
    redirect "/slides"
  else
    @error = "Sorry, wrong username or password"
    redirect "/error"
  end
end

# This logs the user out
get "/logout" do
  session[:user_id] = nil
  #message isn't working...unsure of as to why.
  @message = "We hope to see you again soon!"
  redirect "/"
end