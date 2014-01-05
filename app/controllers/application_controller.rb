class ApplicationController < ActionController::Base
  # Allows incomming call from other APIs
  protect_from_forgery with: :null_session

  ## not_found
  # Render a 404 page
  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
end
