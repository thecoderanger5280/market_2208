require 'rspec'
require './lib/item'
require './lib/vendor'

RSpec.describe Vendor do
  before(:each) do
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
    @vendor = Vendor.new("Rocky Mountain Fresh")
  end

  describe '#initialize' do
    it 'exists' do
      expect(@vendor).to be_an_instance_of(Vendor)
    end

    it 'has a name' do
      expect(@vendor.name).to eq("Rocky Mountain Fresh")
    end

    it 'has an inventory' do
      expect(@vendor.inventory).to eq({})
    end
  end

  describe '#check_stock' do
    it 'can check the stock of an item' do
      expect(@vendor.check_stock(item1)).to eq(0)
    end
  end

  describe '#stock' do
    it 'can stock a number of an item' do
      @vendor.stock(item1, 30)

      expect(@vendor.inventory).to eq({item1 => 30})
      expect(@vendor.check_stock(item1)).to eq(30)

      @vendor.stock(item1, 25)

      expect(@vendor.check_stock(item1)).to eq(55)
    end

    it 'can stock multiple items' do
      @vendor.stock(item1, 55)
      @vendor.stock(item2, 12)

      expect(@vendor.inventory).to eq({item1 => 55, item2 => 12})
    end
  end
end