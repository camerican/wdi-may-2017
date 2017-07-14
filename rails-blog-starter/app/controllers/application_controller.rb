class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_user

  private

  def current_user
    #@current_user = session[:user_id] ? User.find(session[:user_id]) : nil
    begin
      @current_user = session[:user_id] && User.find(session[:user_id])
    rescue
      puts "session[:user_id] error (#{session[:user_id]})"
      session[:user_id] = nil
    end
  end
  def authenticate
    redirect_to :root unless @current_user
  end

end
