require_relative 'board_maker'

class Board
  attr_reader :board_structure

  def initialize
    @board_structure = board_maker.make_with_coordinates
  end

  def [](coordinate)
    @board_structure[coordinate]
  end

  def size
    @board_structure.size
  end

  private

  def board_maker
    BoardMaker.new
  end
end
