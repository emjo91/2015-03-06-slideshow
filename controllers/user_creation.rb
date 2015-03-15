# This creates the user
post "/create_user" do
  @user = User.create(params)
  @user.password = BCrypt::Password.create(params[:password]) 
  @user.save
  session[:user_id] = @user.id
  redirect "/slides"
end