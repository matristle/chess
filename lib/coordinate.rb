class Coordinate
  attr_reader :file, :rank, :symbol

  def initialize(coordinate)
    @symbol = coordinate
    @file = coordinate[0]
    @rank = coordinate[1]
  end

  def file_number_mapping
    { a: 1, b: 2, c: 3, d: 4, e: 5, f: 6, g: 7, h: 8 }
  end

  def file_to_number
    file_number_mapping[file.to_sym].to_i
  end

  def ==(other)
    self.file == other.file && self.rank == other.rank
  end
end
