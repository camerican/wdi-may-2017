class SessionController < ApplicationController

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.password == params[:password]
      session[:user_id] = @user.id
      flash[:notice] = "Hi #{@user.fname}!"
    else 
      flash[:notice] = "We were unable to authenticate you"
    end
    redirect_to home_path
  end
end
