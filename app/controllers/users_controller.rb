class UsersController < ApplicationController

  def new
    if session[:name].nil?
      @user = User.new
    else
      @user = User.find(session[:user_id])
      redirect_to user_path(@user)
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: 'Successfully signed up!'
    else
      render :new
    end
  end

  def show
    if false
    @user = current_user
    @user_created_events = current_user.created_events
    @past_events = current_user.attended_events.previous_events
    @upcoming_events = current_user.attended_events.upcoming_events
    end
  end

  def destroy
    session.delete(:id)
    @current_user = nil
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
