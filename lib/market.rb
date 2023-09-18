class Market
  attr_reader :name, :vendors
  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map do |vendor|
      vendor.name
    end
  end

  def vendors_that_sell(item)
    vendors_with_item = []
    @vendors.find_all do |vendor|
      if vendor.check_stock(item) > 0
        vendors_with_item << vendor.name
      end
    end
    vendors_with_item
  end

  def sorted_item_list
    items_available = []
    @vendors.each do |vendor|
      vendor.inventory.each do |key|
        items_available << key.first.name
      end
    end
    items_available.uniq.sort
  end


  #I struggled with this one. Although I am pretty sure given more time I can fix iteration 2 and finish this.
  def total_inventory
    available = {}
    vendors = []
    @vendors.each do |vendor|
      vendor.inventory.each do |item|
        require 'pry'; binding.pry
        if available.key?(item)
          vendors << vendor
          available[item] = {quantity: quantity
        # else
        #   available[item.first.name] = { quantity: quantity, vendors: [vendor] }
        

        # quantity = item.last
        # vendors = vendor
        # available[item.first.name] = {quantity, vendors}
        

        require 'pry'; binding.pry
        end
      end
    end
  end
end