require_relative 'board_maker'

class Board
  def initialize
    @structure = BoardMaker.new.make
  end

  def empty?
    structure.values.all? { |square| square == :empty }
  end

  def size
    structure.size
  end

  def [](coordinate)
    structure[coordinate]
  end

  private

  attr_reader :structure
end
