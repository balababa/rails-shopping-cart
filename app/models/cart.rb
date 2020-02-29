class Cart
  
  def initialize()
    @items = []  
  end

  def add_item(item)
    @items << item
  end

  def empty?
    @items.empty?
  end
end