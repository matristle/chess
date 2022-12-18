class Coordinate
  attr_reader :file, :rank, :symbol

  def initialize(symbol)
    @symbol = symbol
    @file = symbol[0]
    @rank = symbol[1]

    out_of_bounds_input_guards_for(file, rank)
    
    freeze
  end

  def self.file_to_number(file_letter)
    file_to_number_mapping[file_letter.to_sym].to_s
  end

  def self.number_to_file(file_number)
    number_to_file_mapping[file_number.to_i].to_s
  end

  def self.file_to_number_mapping
    { a: 1, b: 2, c: 3, d: 4, e: 5, f: 6, g: 7, h: 8 }
  end

  def self.number_to_file_mapping
    file_to_number_mapping.invert
  end

  def ==(other)
    self.file == other.file && self.rank == other.rank
  end

  def eql?(other)
    self == other
  end

  def hash
    # exploits the attribute values of `self` to create a unique Array hash value which is the hash value that is returned and used
    array_of_values_hash
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

  def array_of_values_hash
    [self.class, file, rank].hash
  end
end
