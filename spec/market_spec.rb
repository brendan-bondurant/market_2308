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
      expect(@market.vendors.count).to eq(3)
      expect(@market.vendors.first).to eq(@vendor1)
    end
  end
  describe '#vendor_names' do
    it 'can tell vendor names' do
      @market.add_vendor(@vendor1)
      @market.add_vendor(@vendor2)
      @market.add_vendor(@vendor3)
      expect(@market.vendor_names).to eq(["Rocky Mountain Fresh", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
    end
  end
  describe '#vendors_that_sell' do
      it 'can show what vendors have stocked' do
        @market.add_vendor(@vendor1)
        @market.add_vendor(@vendor2)
        @market.add_vendor(@vendor3)
        @vendor1.stock(@item1, 35)
        @vendor1.stock(@item2, 7)
        @vendor2.stock(@item4, 50)    
        @vendor2.stock(@item3, 25)
        @vendor3.stock(@item1, 65)
        expect(@market.vendors_that_sell(@item1)).to eq([@vendor1.name, @vendor3.name])
        expect(@market.vendors_that_sell(@item4)).to eq([@vendor2.name])
    end
  end
  describe '#sorted_item_list' do
    it "lists what is available" do
        @market.add_vendor(@vendor1)
        @market.add_vendor(@vendor2)
        @market.add_vendor(@vendor3)
        @vendor1.stock(@item1, 35)
        @vendor1.stock(@item2, 7)
        @vendor2.stock(@item4, 50)    
        @vendor2.stock(@item3, 25)
        @vendor3.stock(@item1, 65)
        expect(@market.sorted_item_list).to eq(["Banana Nice Cream",
        "Peach",
        "Peach-Raspberry Nice Cream",
        "Tomato"])
    end
  end

  describe "#total_inventory" do 
    it 'tells what and where to find things' do
      @market.add_vendor(@vendor1)
      @market.add_vendor(@vendor2)
      @market.add_vendor(@vendor3)
      @vendor1.stock(@item1, 35)
      @vendor1.stock(@item2, 7)
      @vendor2.stock(@item4, 50)    
      @vendor2.stock(@item3, 25)
      @vendor3.stock(@item1, 65)
      expect(@market.total_inventory).to eq()
    end
  end
end