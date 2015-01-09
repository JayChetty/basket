require_relative '../app/item.rb'

describe Item do
  it "should have a price, id and name" do
    item = Item.new(1, "Choco", 99)
    item.should respond_to :price
    item.should respond_to :name
    item.should respond_to :id
  end

  
end