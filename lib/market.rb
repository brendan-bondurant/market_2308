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
end