class CartsController < ApplicationController

  def add
    @cart.add_item(params[:id])
    session[:cart0001] = @cart.serialize

    # current_cart.add_item(params[:id]) #in module carts_helper
    # session[:cart0001] = current_cart   

    redirect_to products_path, notice: "已加入購物車"
  end

  def show
  end

  def destroy
    session[:cart0001] = nil
    redirect_to cart_path, notice: "已清空購物車"
  end

  def delete_item

    @cart.delete_item params[:id]
    session[:cart0001] = @cart.serialize


    redirect_to cart_path, notice: "商品已刪除"
  end
end
