class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def create
    puts params[:user]
    User.create(user_params)
    flash[:notice] = "Just testing..."
    redirect_to users_path
  end

  def update
    if User.update(user_params)
      flash[:notice] = "Great work!"
      redirect_to user_path @user
    else
      flash[:alert] = "There was a problem saving your update"
      redirect_to users_edit_path
    end
  end

  def new
    @user = User.new
  end

  def edit
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email,:password,:fname,:lname)
  end


end
