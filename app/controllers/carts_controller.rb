class CartsController < ApplicationController

  def add
    cart = Cart.from_hash(session[:cart0001])
    cart.add_item(params[:id])
    session[:cart0001] = cart.serialize

    redirect_to products_path, notice: "已加入購物車"
  end
end
