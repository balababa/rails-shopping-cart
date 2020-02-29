class CartItem
  attr_reader :quantity, :product_id

  def initialize(product_id)
    @product_id = product_id
    @quantity = 1
  end

  def increment
    @quantity += 1
  end

  def product
    Product.find_by(id: product_id)
  end
end