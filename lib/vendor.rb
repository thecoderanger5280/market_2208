class Vendor
  attr_reader :name,
              :inventory
  
              def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    # if(@inventory[item] == nil)
    #   0
    # else
    #   @inventory[item]
    # end
    @inventory[item]
  end

  def stock(item, quantity)
    @inventory[item] += quantity
  end

  def potential_revenue
    @inventory.map { |item, quantity| item.price * quantity }.sum
    # require 'pry'; binding.pry
  end
end