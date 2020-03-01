class CartsController < ApplicationController

  def add
    @cart.add_item(params[:id])
    session[:cart0001] = @cart.serialize

    # current_cart.add_item(params[:id])
    # session[:cart0001] = current_cart   #in module carts_helper

    redirect_to products_path, notice: "已加入購物車"
  end

  def show
  end
end
