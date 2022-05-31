# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :user_sign_up_params, only: [:create]
  # before_action :user_update_params, only: [:update]
  before_filter :authenticate_user! , except: [ :create ]
  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    super
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super

  # def user_params
  #   params.require(:user).permit()
  # end
  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected
  # def user_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :encrypted_password, :reset_password_token, :birth, :gender])
  # end
  # def user_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:name, :encrypted_password, :reset_password_token, :birth, :gender])
  # end=begin=end

  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
