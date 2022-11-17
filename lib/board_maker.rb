class BoardMaker
  def make
    product = bind_empty_squares_to(collected_coordinates)
  end

  private

  def collected_coordinates
    collect_coordinates
  end

  def collect_coordinates
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

  def bind_empty_squares_to(coordinates)
    coordinates.map { |coordinate| [coordinate, :empty] }
               .to_h
  end
end
