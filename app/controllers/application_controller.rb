class ApplicationController < ActionController::Base
 before_action :configure_permitted_parameters, if: :devise_controller?
 before_action :authenticate_user!, :unless => :devise_controller?
 protected
 def authenticate_user!
   unless user_signed_in?
   store_location_for(:user, timeline_path)
   redirect_to new_user_session_path
 end
end

 def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :dob, :email, :password, :password_confirmation, :profile_pic,:gender)}

   devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password,:gender)}

 end
end