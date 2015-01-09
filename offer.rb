class Offer
  attr_reader :price, :items
  def initialize(items, price)
    @items = items
    @price = price
  end

  def item_prices
    @items.map do |item|
      item.price
    end
  end

  def total_standard_price
    item_prices.reduce do |sum,price|
      sum + price
    end
  end

  def saving
    total_standard_price - price
  end
end