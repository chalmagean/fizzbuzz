class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate_user_from_token!
  before_action :authenticate_user!

  private

    def authenticate_user_from_token!
      user_token = params[:auth_token].presence
      user = user_token && User.find_by_authentication_token(user_token.to_s)

      if user && Devise.secure_compare(user.authentication_token, params[:auth_token])
        sign_in user, store: false
      end
    end
end
