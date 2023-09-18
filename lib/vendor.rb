class Vendor
  attr_reader :name, :inventory
  def initialize(name)
    @name = name
    @inventory = {}

  end

  def check_stock(item)
    # require 'pry'; binding.pry
    if @inventory.include?(item)
      @inventory[item]
    else
      0
    end
  end

  def stock(item, number)
    if @inventory.key?(item)
      @inventory[item] += number
    else
      @inventory[item] = number
    end
  end
  
  # I could not figure out how to pull the price out of this, I will return if I have time, but I have spent too much time on this already
  # def potential_revenue
  #   @inventory.each do |item|
  #     require 'pry'; binding.pry
  #     item.price
  #   end
  # end
end