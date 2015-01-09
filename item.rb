class Item
  attr_accessor :price, :name
  attr_reader :id

  def initialize(id, name, price)
    @id = id
    @name = name
    @price = price
  end
end