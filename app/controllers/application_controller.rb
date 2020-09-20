class ApplicationController < ActionController::Base
  helper_method :current_user

  class Forbidden < ActionController::ActionControllerError; end
  class IpAddressRejected < ActionController::ActionControllerError; end

  include ErrorHandlers if Rails.env.production?
  include CurrentUserHelper
end
