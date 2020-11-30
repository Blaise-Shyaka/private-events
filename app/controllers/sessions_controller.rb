class SessionsController < ApplicationController
  def new
    @session = session
  end

  def create
    params[:name]
    @user = User.where(:name => params[:name])
    if @user.id
      session[current_user_id] = @user.id
      redirect_to user_path, notice: "Signed in successfully"
    end
  end

  private
  def session_params
    params.require(:session).permit(:name)
  end
end