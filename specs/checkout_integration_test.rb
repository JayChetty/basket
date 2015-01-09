require_relative '../app/offer.rb'
require_relative '../app/item.rb'
require_relative '../app/basket.rb'
require_relative '../app/saving_calculator'


describe "checking out a basket" do

  before(:each) do
    @choco = Item.new(1, "Choco", 100)
    @apple = Item.new(2, "Apple", 50)
    @orange = Item.new(3, "Orange", 75)
    @drink = Item.new(4, "Drink", 150)

    @bogof_choc = Offer.new([@choc,@choc], 100)#saving 100
    @drink_orange_two_pounds = Offer.new([@orange,@drink], 200)#saving 25

    @offers = [@bogof_choc, @drink_orange_two_pounds]

    @saving_calculator = SavingCalculator.new(@offers)
    @basket = Basket.new(@saving_calculator)
  end
  #create items

  it "should give total values for single item" do
    @basket.add_item(@choco)
    @basket.total_price_without_saving.should == 100
    @basket.discount_saving.should == 0
    @basket.total_price_with_saving.should == 100
  end
  
end