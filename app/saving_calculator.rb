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

  def found_offers(items)
    copy_items = Array.new(items)
    found_offers = []
    @offers.each do |offer|
      might_find_offer = true
      #loop until offer not found in case multiple of same offers
      while might_find_offer
        if offer_found(offer,copy_items)
          found_offers.push(offer)
          #remove the items that triggered the offer so dont duplicated offers
          offer.items.each do |item|
            index = copy_items.index(item)
            copy_items.delete_at(index)
          end
        else
          might_find_offer = false
        end
      end
    end
    found_offers
  end

  def amount_saved(items)
    found_offers(items).reduce(0) do |sum,offer|
      sum + offer.saving
    end
  end
end