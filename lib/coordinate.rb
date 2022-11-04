class Coordinate
  attr_reader :file, :rank

  def initialize(coordinate = nil)
    @symbol = coordinate
    @file = coordinate[0]
    @rank = coordinate[1]
  end

  def to_sym
    symbol
  end

  def file_number_mapping
    { a: 1, b: 2, c: 3, d: 4, e: 5, f: 6, g: 7, h: 8 }
  end

  def number_file_mapping
    file_number_mapping.invert
  end

  def file_to_number
    file_number_mapping[file.to_sym].to_i
  end

  def number_to_file(number)
    number_file_mapping[number]
  end

  def ==(other)
    self.file == other.file && self.rank == other.rank
  end

  def slide_rank_by(amount)
    new_rank = (self.rank.to_i + amount).to_s
    (self.file + new_rank).to_sym
  end

  def slide_file_by(amount)
    new_file = number_to_file(self.file_to_number + amount).to_s
    (new_file + self.rank).to_sym
  end

  def slide_file_and_rank(file_amount:, rank_amount:)
    new_file = slide_file_by(file_amount)[0]
    new_rank = slide_rank_by(rank_amount)[1]

    (new_file + new_rank).to_sym
  end

  private

  attr_reader :symbol
end
