# Should verify a user is logged in before viewing precious slides.
before "/slides" do
  if session[:user_id] == nil
    @error = "Need to log in..."
    redirect "/"
  end
end

# This shows the slides
get "/slides" do
  @user = User.find(session[:user_id])
  @message = "Logged in: #{@user.username}"
  erb :"main_slides/index"
end

# This grabs the slides
get "/slide/:slide_order" do
  slide = Slide.find(params[:slide_order])
  slide_hash = slide.to_hash
  slide_hash.to_json
end