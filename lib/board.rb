require_relative 'board_maker'

class Board
  attr_reader :board_structure

  def initialize
    @board_structure = BoardMaker.new.make_with_coordinates
  end
end
