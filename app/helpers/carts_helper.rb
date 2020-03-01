module CartsHelper
  def current_cart
    @cart ||= Cart.from_hash(session[:cart0001])
  end
end
