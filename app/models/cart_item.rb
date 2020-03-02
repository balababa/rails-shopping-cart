class CartItem
  attr_reader  :product_id
  attr_accessor :quantity

  def initialize(product_id, quantity = 1)
    @product_id = product_id
    @quantity = quantity
  end

  def calculate(n = 1, &symbol)
    rlt = symbol.call(quantity, n)
    @quantity = rlt < 0 ? 0 : rlt
  end

  def product
    Product.find_by(id: product_id)
  end

  def price
    product.price * quantity
  end
end