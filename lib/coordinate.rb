class Coordinate
  attr_reader :file, :rank, :symbol

  def initialize(symbol)
    @symbol = symbol
    @file = symbol[0]
    @rank = symbol[1]

    out_of_bounds_input_guards_for(file, rank)
  end

  def self.file_to_number(file_letter)
    file_number_mapping[file_letter.to_sym].to_s
  end

  def self.file_number_mapping
    { a: 1, b: 2, c: 3, d: 4, e: 5, f: 6, g: 7, h: 8 }
  end

  private

  def out_of_bounds_input_guards_for(file, rank)
    unless file.between?('a', 'h')
      raise "'#{file}' is out of bounds: file letters must be between 'a' and 'h'"
    end

    unless rank.between?('1', '8')
      raise "'#{rank}' is out of bounds: rank numbers must be between '1' and '8'"
    end
  end
end
