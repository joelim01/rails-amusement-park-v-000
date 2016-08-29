class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


    def redirect_if_logged_in
      if session[:user_id]
        redirect_to root_path
      end
    end

    def redirect_if_not_logged_in
      if !session[:user_id]
        redirect_to root_path
      end
    end


end
