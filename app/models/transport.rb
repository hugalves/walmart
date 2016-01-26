class Transport
  def initialize(range_of, fuel_price)
    @range_of   = range_of
    @fuel_price = fuel_price
  end

  attr_reader :range_of, :fuel_price
end
