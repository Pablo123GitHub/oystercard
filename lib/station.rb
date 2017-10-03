class Station
  attr_reader :zone, :name
  def initialize(station)
    @name = station[:name]
    @zone = station[:zone]
  end
end
