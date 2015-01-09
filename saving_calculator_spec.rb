require_relative './offer.rb'
require_relative './item.rb'
require_relative './saving_calculator'

describe "SavingCalculator" do 
  it "should be created with list of all offers" do
    choco = Item.new(1, "Choco", 100)
    apple = Item.new(1, "Apple", 50)
    offer1 = Offer.new([choco,choco], 150)
    offer2 = Offer.new([apple,apple], 75)
    saving_calc = SavingCalculator.new([offer1,offer2])
    saving_calc.offers.should == [offer1,offer2]
  end

  it "should be able to check if an offer is found in a list of items" do
    choco = Item.new(1, "Choco", 100)
    apple = Item.new(1, "Apple", 50)
    offer1 = Offer.new([choco,choco], 150)
    offer2 = Offer.new([apple,apple], 75)
    items = [offer1,offer2]
    saving_calc = SavingCalculator.new(items)
    saving_calc.offer_found(offer1, [choco, choco, apple]).should == true
  end 

  it "should be able to check if an offer is not found in a list of items" do
    choco = Item.new(1, "Choco", 100)
    apple = Item.new(1, "Apple", 50)
    offer1 = Offer.new([choco,choco], 150)
    offer2 = Offer.new([apple,apple], 75)
    items = [offer1,offer2]
    saving_calc = SavingCalculator.new(items)
    saving_calc.offer_found(offer1, [choco, apple]).should == false
  end

  it "should be able to check if an offer is not found in a list of items" do
    choco = Item.new(1, "Choco", 100)
    apple = Item.new(1, "Apple", 50)
    offer1 = Offer.new([choco,choco], 150)
    offer2 = Offer.new([apple,apple], 75)
    items = [offer1,offer2]
    saving_calc = SavingCalculator.new(items)
    saving_calc.offer_found(offer2, [apple, apple]).should == true
  end  

   it "should not alter original list of items" do
    choco = Item.new(1, "Choco", 100)
    apple = Item.new(1, "Apple", 50)
    offer1 = Offer.new([choco,choco], 150)
    offer2 = Offer.new([apple,apple], 75)
    items = [offer1,offer2]
    saving_calc = SavingCalculator.new(items)
    items.should == [offer1,offer2]
  end   
end