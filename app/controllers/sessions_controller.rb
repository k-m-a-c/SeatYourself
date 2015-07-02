class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      flash[:notice] = "Successfully logged in!"
      session[:user_id] = user.id
      redirect_to :root
    else
      flash[:alert] = "Wrong email address or password.  Try again."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have logged out."
    redirect_to :root
  end
end
