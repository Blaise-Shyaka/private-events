class SessionsController < ApplicationController

  def create
    @user = User.find_by_name(params[:name])
    if @user
      session[:user_id] = @user.id
      session[:name] = @user.name
      redirect_to root_path 
      flash.notice = 'Logged in!'
    else
      flash.now.alert = 'Invalid user name'
      render 'sessions#new'
    end
  end

  def destroy
    session.delete(:name)
    session.delete(:user_id)
    session[:user_id] = nil
    redirect_to root_path
    flash.notice = 'Logged out!'
  end
end
