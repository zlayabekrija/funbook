# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
 # before_action :configure_sign_in_params, only: [:create]
  # def after_sign_in_path_for(resource)
  #   redirect_to new_user_session_path || super
  # end
  # GET /resource/sign_in
  def new
    super
  end


  def root
    if signed_in?
      redirect_to timeline_path
    else
      redirect_to  new_user_session_path
    end
  end

  # POST /resource/sign_in
  def create
    super
    # if resource.save
    #   redirect_to reso_path
    # else
    #   redirect_to users_path
    # end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
