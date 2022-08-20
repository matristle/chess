# The BoardMaker class is responsible for making the board with coordinate keys and empty string values

class BoardMaker
  attr_reader :board_product, :file_letters, :rank_numbers

  def initialize
    @board_product = {}
    @file_letters = ('a'..'h').to_a
    @rank_numbers = ('1'..'8').to_a
  end

  def make_with_coordinates
    file_letters.size.times do |file_index|
      rank_numbers.size.times do |rank_index|
        coordinate = file_letters[file_index] + rank_numbers[rank_index]
        @board_product[coordinate.to_sym] = ''
      end
    end

    return board_product
  end
end
