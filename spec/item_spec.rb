require 'rspec'
require './lib/item'

RSpec.describe Item do
  describe '#initialize' do
    it 'exists' do
      peach = Item.new({name: 'Peach', price: "$0.75"})
      
      expect(peach).to be_an_instance_of(Item)
    end

    it 'has a name' do
      peach = Item.new({name: 'Peach', price: "$0.75"})

      expect(peach.name).to eq('Peach')
    end

    it 'has a price' do
      peach = Item.new({name: 'Peach', price: "$0.75"})

      expect(peach.price).to eq(0.75)
    end
  end
end