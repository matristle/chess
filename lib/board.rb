require_relative 'board_maker'

class Board
  attr_reader :board_structure, :selected_piece

  def initialize
    @board_structure = board_maker.make_with_coordinates
  end

  def [](coordinate)
    board_structure[coordinate]
  end

  def size
    board_structure.size
  end

  def coordinate?(coordinate)
    board_structure.key?(coordinate)
  end

  def transport(destination_coordinate:)
    @board_structure[destination_coordinate] = selected_piece if coordinate?(destination_coordinate)
  end

  private

  def board_maker
    BoardMaker.new
  end
end
