class BoardMaker
  def make
    bind_empty_squares_to_coordinates
  end

  def self.file_to_number(file_letter)
    file_number_mapping[file_letter.to_sym].to_s
  end
  
  def self.file_number_mapping
    { a: 1, b: 2, c: 3, d: 4, e: 5, f: 6, g: 7, h: 8 }
  end

  private
  
  def bind_empty_squares_to_coordinates
    collected_coordinates.map { |coordinate| [coordinate, :empty] }
                         .to_h
  end

  def collected_coordinates
    file_letters.product(rank_numbers)
                .map(&:join)
                .map(&:to_sym)
  end

  def file_letters
    ('a'..'h').to_a
  end

  def rank_numbers
    ('1'..'8').to_a
  end
end
