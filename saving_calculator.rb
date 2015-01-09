class SavingCalculator
  attr_reader :offers
  def initialize(offers)
    @offers = offers
  end

  def offer_found(offer, items)
    copy_items = Array.new(items)
    offer.items.each do |item|
      if index = copy_items.index(item)
        copy_items.delete_at(index)
      else
        return false
      end
    end
    true
  end
end