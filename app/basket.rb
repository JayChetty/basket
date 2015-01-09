class Basket
  attr_reader :items
  def initialize(saving_calculator)
    @items = []
    @saving_calculator = saving_calculator
  end

  def add_item(item)
    @items.push(item)
  end

  def item_prices
    @items.map do |item|
      item.price
    end
  end

  def total_price_without_saving
    item_prices.reduce do |sum,price|
      sum + price
    end
  end

  def discount_saving
    saving = @saving_calculator.amount_saved(@items)
  end

  def total_price_with_saving
    total_price_without_saving - discount_saving
  end
end