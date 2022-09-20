class Market
  attr_reader :name,
              :vendors
  
  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map { |vendor| vendor.name }
  end

  def vendors_that_sell(item)
    @vendors.find_all { |vendor| vendor.inventory[item] != 0 }
  end

  def total_inventory
    items = []
    quantities = Hash.new(0)
    inventory = {}
    @vendors.each do |vendor|
      # require 'pry'; binding.pry
      vendor.inventory.keys.each_with_index do |item, i|
        # require 'pry'; binding.pry
        items << vendor.inventory.keys[i]
        quantities[item] += vendor.inventory.values.find_all { |value| }
      end
    end
    # require 'pry'; binding.pry

    unique_items = items.flatten.uniq
    unique_items.each_with_index do |item, i|
      # require 'pry'; binding.pry
      vendors_with_item = @vendors.find_all do |vendor|
        vendor.inventory.include?(item)
      end
      # require 'pry'; binding.pry
      inventory[item] = {quantity: quantity[item], vendors: vendors_with_item}
    end
    # require 'pry'; binding.pry
    inventory
  end
end