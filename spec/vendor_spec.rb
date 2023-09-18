require './spec/spec_helper'

RSpec.describe Vendor do
  before(:each) do
    @vendor = Vendor.new("Rocky Mountain Fresh")
    item1 = Item.new({name: 'Peach', price: "$0.75"})
    item2 = Item.new({name: 'Tomato', price: '$0.50'})
  end
  describe '#initialize' do 
    it 'exists' do
      expect(@vendor).to be_a(Vendor)
    end
    it 'has inventory' do
      expect(@vendor.inventory).to eq({})
    end
    it 'can check stock' do
      expect(vendor.check_stock(item1)).to eq(0)
    end
  end
  describe '#stock' do
    it 'can stock items' do
      @vender.stock(item1, 30)
      expect(@vendor.inventory.count).to eq(30)
      expect(@vendor.check_stock(item1)).to eq(30)
    end
    it 'can stock more' do
      @vender.stock(item1, 30)
      expect(@vendor.check_stock(item1)).to eq(30)
      @vender.stock(item1, 25)
      expect(@vendor.check_stock(item1)).to eq(55)
    end
    it 'can check inventory of multiple objects' do 
      @vender.stock(item1, 30)
      @vender.stock(item1, 25)
      expect(@vendor.inventory[item1]).to eq(55)
      expect(@vendor.inventory[item2]).to eq(12)

    end
  end
end