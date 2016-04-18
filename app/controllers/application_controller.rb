class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  private

   def current_user
     @current_user ||= User.find(session[:user_id]) if session[:user_id]
   end

   def authenticate
     unless current_user
       flash[:errors] = "Please register or sign up before continuing."
       redirect_to new_session_path
     end
   end
end
