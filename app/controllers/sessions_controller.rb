class SessionsController < ApplicationController
  def index
    @user = User.create
  end

  def new
  end

  def create
    user = User.where(email: params[:email]).first
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Successfully signed in."
      redirect_to new_result_path
    else
      flash[:errors] = 'Please enter a valid username or password.'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Successfully signed out."
    redirect_to new_result_path
  end

end
