class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.where(email: params[:email]).first
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "SIGNED IN!"
      redirect_to new_result_path
    else
      flash[:errors] = 'Invalid username or password'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "SIGNED OUT!"
    redirect_to new_result_path
  end

end
