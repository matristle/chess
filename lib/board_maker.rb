class BoardMaker
  def make
    board_product = {}

    file_letters.product(rank_numbers) do |coordinate_pair|
      current_coordinate = coordinate_pair[0] + coordinate_pair[1]
      board_product[current_coordinate.to_sym] = :empty
    end

    board_product
  end

  private

  def file_letters
    ('a'..'h').to_a
  end

  def rank_numbers
    ('1'..'8').to_a
  end
end
