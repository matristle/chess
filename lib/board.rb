require_relative 'board_maker'

class Board
  attr_reader :board_structure

  def initialize
    @board_structure = board_maker.make_with_coordinates
  end

  private

  def board_maker
    BoardMaker.new
  end
end
