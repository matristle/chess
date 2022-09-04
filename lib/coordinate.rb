class Coordinate
  attr_reader :file, :rank
  
  def initialize(coordinate)
    @file = coordinate[0]
    @rank = coordinate[1]
  end 
end
