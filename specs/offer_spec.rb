require_relative '../app/offer.rb'
require_relative '../app/item.rb'

describe Offer do
  before(:each)do
    @item = Item.new(1, "Choco", 100)
    @offer = Offer.new([@item,@item], 150)
  end

  it "should expose price" do
    @offer.price.should == 150
  end

  it "should show the standard price of the items" do
    @offer.item_prices.should == [100,100]
  end

  it "should give total standard price" do
    @offer.total_standard_price.should == 200
  end

  it "should return saving" do
    @offer.saving.should == 50
  end

  
end