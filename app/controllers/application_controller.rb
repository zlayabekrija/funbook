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
  def stay_on_same_path
    prev = Rails.application.routes.recognize_path(request.referrer)
    if prev[:controller] == "posts"
        redirect_to timeline_path
    else
      session[:return_to] ||= request.referer
      redirect_to session.delete(:return_to)
    end
  end
end