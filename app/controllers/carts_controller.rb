class CartsController < ApplicationController

  def add
    @cart.add_item(params[:id])
    session[Cart::SessionKey] = @cart.serialize

    # current_cart.add_item(params[:id]) #in module carts_helper
    # session[Cart::SessionKey] = current_cart   

    redirect_to products_path, notice: "已加入購物車"
  end

  def show
  end

  def destroy
    session[Cart::SessionKey] = nil
    redirect_to cart_path, notice: "已清空購物車"
  end

  def delete_item
    @cart.delete_item params[:id]
    session[Cart::SessionKey] = @cart.serialize

    redirect_to cart_path, notice: "商品已刪除"
  end

  def change_num
    @cart.find_item(params[:id]).calculate(&params[:symbol].to_sym)
    session[Cart::SessionKey] = @cart.serialize

    redirect_to cart_path
  end
end
