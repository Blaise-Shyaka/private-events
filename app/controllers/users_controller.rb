class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      cookies[:current_user_id] = @user.id
      redirect_to root_path, notice: 'Successfully signed up!'
    else
      render :new
    end
  end

  def show
    # @user = User.find(session[:current_user_id])
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
