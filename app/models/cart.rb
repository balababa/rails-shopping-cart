class Cart
  attr_reader :items

  def initialize(items = [])
    @items = items  
  end

  def add_item(product_id)
    item_found = items.find {|item| item.product_id == product_id}
    
    if item_found
      item_found.calculate(&:+)
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

  def serialize
    # {"items" => items.map {|item| {"product_id" => item.product_id, "quantity" => item.quantity}} }
    all_items = items.map { |item|
      { "product_id" => item.product_id, "quantity" => item.quantity}
    }

    { "items" => all_items }
  end

  def self.from_hash(hash)
    if hash.nil?
      new 
    else
      new hash["items"].map {|item| CartItem.new(item["product_id"], item["quantity"])}
    end
  end

  def delete_item(product_id)
    items.delete_if {|item| item.product_id == product_id }
  end

  def find_item(product_id)
    items.find {|item| item.product_id == product_id }
  end

  def delete_zero
    items.delete_if {|item| item.quantity.zero? }
  end
end