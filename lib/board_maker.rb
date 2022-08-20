# The BoardMaker class is responsible for making the board with coordinate keys and empty string values

class BoardMaker
  attr_reader :board_product, :file_letters, :rank_numbers

  def initialize
    @board_product = {}
    @file_letters = ('a'..'h').to_a
    @rank_numbers = ('1'..'8').to_a
  end

  def make_with_coordinates
    file_letters.product(rank_numbers) do |combo|
      coordinate = combo.first + combo.last
      @board_product[coordinate.to_sym] = ''
    end

    return board_product
  end
end
