class Board
  attr_reader :board_structure

  def initialize
    @board_structure = {}
    file_letters = ('a'..'h').to_a
    rank_numbers = ('1'..'8').to_a

    file_letters.size.times do |file_index|
      rank_numbers.size.times do |rank_index|
        coordinate = file_letters[file_index] + rank_numbers[rank_index]
        @board_structure[coordinate.to_sym] = ''
      end
    end
  end
end
