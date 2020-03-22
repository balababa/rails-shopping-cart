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
    redirect_to products_path, notice: "已清空購物車"
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

  def payment
    redirect_to cart_path, notice: "購物車為空" if @cart.empty?

    @token = gateway.client_token.generate()
  end

  def pay
    result = gateway.transaction.sale(
  amount:  "#{@cart.total_price}",
  payment_method_nonce:  params[:nonce],
  options: {
    submit_for_settlement:  true
  }
)

if result.success?
  session[Cart::SessionKey] = nil
  redirect_to products_path, notice: "付款成功"
else
  redirect_to products_path, notice: "付款失敗"
end
  end

  private
  def gateway
    Braintree::Gateway.new(
      environment:  :sandbox,
      merchant_id:  ENV['merchant_id'],
      public_key:  ENV['public_key'],
      private_key: ENV['private_key'],
    )
  end
end
