class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user && user.password == params[:password]
      session[:user_id] = user.id
      flash[:notice] = "Hi! #{user.fname}"
      # redirect_to user_path(user)
      redirect_to user
    else
      flash[:notice] = "Unable to find you"
      #redirect_to :back :'(
      redirect_to :root
    end
  end
  def destroy
  end
end
