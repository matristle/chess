require_relative 'board_maker'

class Board
  def initialize
    @structure = board_maker.make
  end

  def empty?
    squares.all? { |square| square == :empty }
  end

  def number_of_squares
    structure.size
  end

  def [](coordinate)
    structure[coordinate]
  end

  private

  attr_reader :structure

  def board_maker
    BoardMaker.new
  end

  def squares
    structure.values
  end
end
