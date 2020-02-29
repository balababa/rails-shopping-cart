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
end