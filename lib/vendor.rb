class Vendor
  attr_reader :name, :inventory
  def initialize(name)
    @name = name
    @inventory = {}

  end

  def check_stock(item)

    if @inventory.include?(item.name)
      @inventory[item.name]
    else
      0
    end
  end

  def stock(item, number)
    if @inventory.key?(item.name)
      @inventory[item.name] += number
    else
      @inventory[item.name] = number
    end
  end
end