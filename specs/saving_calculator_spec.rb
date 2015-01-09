require_relative '../app/offer.rb'
require_relative '../app/item.rb'
require_relative '../app/saving_calculator'

describe "SavingCalculator" do

  before(:each) do
    @choco = Item.new(1, "Choco", 100)
    @apple = Item.new(2, "Apple", 50)
    @offer1 = Offer.new([@choco,@choco], 150)
    @offer2 = Offer.new([@apple,@apple], 75)
    @offers = [@offer1,@offer2]
    @saving_calc = SavingCalculator.new(@offers)
  end

  it "should be created with list of all offers" do
    @saving_calc.offers.should == [@offer1,@offer2]
  end

  it "should be able to check if an offer is found in a list of items" do
    @saving_calc.offer_found(@offer1, [@choco, @choco, @apple]).should == true
  end 

  it "should be able to check if an offer is not found in a list of items" do
    @saving_calc.offer_found(@offer1, [@choco, @apple]).should == false
  end

  it "should be able to check if an offer is not found in a list of items" do
    @saving_calc.offer_found(@offer2, [@apple, @apple]).should == true
  end  

  it "should not alter original list of items" do
    items = [@apple, @apple]
    @saving_calc.offer_found(@offer2, items )
    items.should == [@apple, @apple]
  end 

  it "should be able to find offers that match a given list of items single" do
    items = [@apple, @apple]
    @saving_calc.found_offers(items).should == [@offer2]
  end

  it "should be able to find offers that match a given list of items multiple" do
    items = [@apple, @choco, @apple, @choco]
    @saving_calc.found_offers(items).should == [@offer1, @offer2]
  end

  it "should be able to find offers that match a given list of items multiple 2" do
    items = [@apple, @choco, @apple, @choco, @apple]
    @saving_calc.found_offers(items).should == [@offer1, @offer2]
  end

  it "should be able to find offers that match a given list of items multiple same" do
    items = [@apple, @choco, @apple, @choco, @apple, @apple]
    @saving_calc.found_offers(items).should == [@offer1, @offer2, @offer2]
  end

  it "should be able to show the total saving" do
    items = [@apple, @choco, @apple, @choco, @apple, @apple]
    @saving_calc.amount_saved(items).should == (50 + 25 + 25)
  end 

end