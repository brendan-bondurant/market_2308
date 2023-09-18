require './spec/spec_helper'

RSpec.describe Vendor do
  before(:each) do
    @vendor = Vendor.new("Rocky Mountain Fresh")
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
    @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
  end
  describe '#initialize' do 
    it 'exists' do
      expect(@vendor).to be_a(Vendor)
    end
    it 'has name' do
      expect(@vendor.name).to eq("Rocky Mountain Fresh")
    end
    it 'has inventory' do
      expect(@vendor.inventory).to eq({})
    end
  end
  describe "#check stock" do
    it 'can check stock' do
      expect(@vendor.check_stock(@item1)).to eq(0)
    end
  end
  describe '#stock' do
    it 'can stock items' do
      @vendor.stock(@item1, 30)
      expect(@vendor.inventory.keys.count).to eq(1)

      expect(@vendor.check_stock(@item1)).to eq(30)
    end
    it 'can stock more' do
      @vendor.stock(@item1, 30)
      expect(@vendor.check_stock(@item1)).to eq(30)
      @vendor.stock(@item1, 25)
      expect(@vendor.check_stock(@item1)).to eq(55)
    end
    it 'can check inventory of multiple objects' do 
      @vendor.stock(@item1, 30)
      @vendor.stock(@item1, 25)
      @vendor.stock(@item2, 12)

      expect(@vendor.inventory[@item1.name]).to eq(55)
      expect(@vendor.inventory[@item2.name]).to eq(12)

    end
  end
end