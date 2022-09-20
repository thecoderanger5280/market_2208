class Item
  attr_reader :name,
              :price

  def initialize(details)
    @name = details[:name]
    @price = details[:price].split('$')[1].to_f
  end
end