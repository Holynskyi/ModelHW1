class ApplicationController < ActionController::Base
  before_action :set_current_cart

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def render_404
  	render file: "public/404", status: 404
  end

  private
  def set_current_cart
  	session[:cart_id] ||= Cart.create.id
  end
end
