require './spec/spec_helper'

RSpec.describe Market do
  before(:each) do
    @market = Market.new("South Pearl Street Farmers Market")
    @vendor1 = Vendor.new("Rocky Mountain Fresh")
    @vendor2 = Vendor.new("Ba-Nom-a-Nom")
    @vendor3 = Vendor.new("Palisade Peach Shack")
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: "$0.50"})
    @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
  end

  describe "#initialize" do 
    it 'exists' do 
      expect(@market).to be_a(Market)
    end
    it 'has a name' do
      expect(@market.name).to eq("South Pearl Street Farmers Market")
    end
    it 'can have vendors' do
      expect(@market.vendors).to eq([])
    end
    it 'can have vendors' do
      @market.add_vendor(@vendor1)
      @market.add_vendor(@vendor2)
      @market.add_vendor(@vendor3)
      expect(@market.venders.count).to eq(3)
      expect(@market.venders.first).to eq(@vendor1)
    end
  end
  describe '#vendor_names' do
    it 'can tell vendor names' do
      @market.add_vendor(@vendor1)
      @market.add_vendor(@vendor2)
      @market.add_vendor(@vendor3)
      expect(market.vendor_names).to eq(["Rocky Mountain Fresh", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
    end
  end
  describe '#vendors_that_sell' do
      it 'can show what vendors have stocked' do
        @vendor1.stock(@item1, 35)
        @vendor1.stock(@item2, 7)
        @vendor2.stock(@item4, 50)    
        @vendor2.stock(@item3, 25)
        @vendor3.stock(@item1, 65)
        expect(@market.vendors_that_sell(@item1)).to eq(@vendor1, @vendor3)
        expect(@market.vendors_that_sell(@item4)).to eq(@vendor2)
    end
  end
  describe '#potential_revenue' do
    it 'can tell potential revenue' do
      @vendor1.stock(@item1, 35)
      @vendor1.stock(@item2, 7)
      @vendor2.stock(@item4, 50)    
      @vendor2.stock(@item3, 25)
      @vendor3.stock(@item1, 65)
      expect(@vendor1.potential_revenue).to eq(29.75)
      expect(@vendor2.potential_revenue).to eq(345.00)
      expect(@vendor3.potential_revenue).to eq(48.75)
    end
  end

end