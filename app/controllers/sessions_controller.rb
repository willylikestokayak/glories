class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(user_params)

    if user
      session[:user_id] = user.id
      flash[:success] = "Reading is good for the soul"
      redirect_to root_path
    else
      flash[:danger] = "Please sign in"
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You will be missed; come back soon!"
    redirect_to login_path
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end

end