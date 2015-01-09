require_relative '../app/item.rb'
require_relative '../app/basket.rb'

describe Basket do
  it "should be created with no items" do
    saving_calculator = double()
    basket = Basket.new(saving_calculator)
    basket.items.length.should == 0
  end

  it "should be able to add items" do
    saving_calculator = double()
    basket = Basket.new(saving_calculator)
    choco = Item.new(1, "Choco", 100)
    basket.add_item(choco)
    apple = Item.new(2, "Apple", 50)
    basket.add_item(apple)
    orange = Item.new(3, "Orange", 40)
    basket.add_item(orange)

    basket.items.should == [choco,apple,orange]
  end

  it "should be able to add items" do
    saving_calculator = double()
    basket = Basket.new(saving_calculator)
    choco = Item.new(1, "Choco", 100)
    basket.add_item(choco)
    apple = Item.new(2, "Apple", 50)
    basket.add_item(apple)
    orange = Item.new(3, "Orange", 40)
    basket.add_item(orange)

    basket.items.should == [choco,apple,orange]
  end

  it "should give total price" do
    saving_calculator = double()
    basket = Basket.new(saving_calculator)
    choco = Item.new(1, "Choco", 100)
    basket.add_item(choco)
    apple = Item.new(2, "Apple", 50)
    basket.add_item(apple)
    orange = Item.new(3, "Orange", 40)
    basket.add_item(orange)

    basket.total_price_without_saving.should == 190
  end

  it "should give discount saving" do
    saving_calculator = double()
    basket = Basket.new(saving_calculator)
    choco = Item.new(1, "Choco", 100)
    basket.add_item(choco)
    apple = Item.new(2, "Apple", 50)
    basket.add_item(apple)
    orange = Item.new(3, "Orange", 40)
    basket.add_item(orange)

    saving_calculator.should_receive(:amount_saved).and_return(50)
    basket.discount_saving()
  end 

  it "should give total amount with saving" do
    saving_calculator = double()
    basket = Basket.new(saving_calculator)
    choco = Item.new(1, "Choco", 100)
    basket.add_item(choco)
    apple = Item.new(2, "Apple", 50)
    basket.add_item(apple)
    orange = Item.new(3, "Orange", 40)
    basket.add_item(orange)

    saving_calculator.should_receive(:amount_saved).and_return(50)
    basket.total_price_with_saving.should == (190-50)
  end   
end