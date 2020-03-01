class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :init_cart #其他controller可能也會用到，故放在上層controller
  include CartsHelper #current_cart in helper
  private
  def init_cart
    @cart = Cart.from_hash(session[:cart9487])
  end
end
