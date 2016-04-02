class RegistrationsController < ApplicationController
  def new
    unless current_user
    @user = User.new
    else
      flash[:notice] = "You are already signed in"
      redirect_to new_result_path
    end
  end

  def create
    @user = User.new(sign_up_params)
    if @user.save
      flash[:notice] = 'Account created'
      redirect_to new_session_path
    else
      flash[:errors] = @user.errors.full_messages.join(", ")
      redirect_to new_registration_path
    end
  end

  def destroy
  end

  private

  def sign_up_params
    params.require(:user).permit(
    :username,
    :email,
    :password,
    :password_confirmation
    )
  end

end
