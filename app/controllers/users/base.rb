class Users::Base < ApplicationController
  private

    def current_user
      if session[:user_id]
        @current_user ||= User.find(session[:user_id])
    end
    helper_method :current_user

    TIMEOUT = 60.minutes

    def check_timeout
      if current_user
        if session[:last_access_time] >= TIMEOUT.ago
          session[:last_access_time] = Time.current_user
        else
          session.delete(:user_id)
          redirect_to root_path
        end
      end
    end

        
end