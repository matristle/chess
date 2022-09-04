class Coordinate
  attr_reader :file, :rank
  
  def initialize(coordinate)
    @file = coordinate[0]
    @rank = coordinate[1]
  end

  def file_number_mapping
    { a: 1, b: 2, c: 3, d: 4, e: 5, f: 6, g: 7, h: 8 }
  end

  def file_to_number
    file_number_mapping[file.sym].to_i
  end
end
