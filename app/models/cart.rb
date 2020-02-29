class Cart
  attr_reader :items

  def initialize()
    @items = []  
  end

  def add_item(product_id)
    item_found = items.find {|item| item.product_id == product_id }
    
    if item_found
      item_found.increment
    else
      items << CartItem.new(product_id)
    end
  end

  def empty?
    items.empty?
  end

  def total_price
    items.reduce(0) {|sum, item| sum + item.price}
  end

  def total_price_after_promotion(promotion)
    promotion.call(total_price)
  end
end