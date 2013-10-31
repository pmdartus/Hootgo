class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  ## not_found
  # Render a 404 page
  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
end
