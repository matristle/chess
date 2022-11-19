require_relative 'board_maker'

class Board
  def initialize
    @structure = board_maker.make
  end

  def [](coordinate)
    structure[coordinate]
  end
  
  def empty?
    squares.all? { |square| square.empty? }
  end

  def number_of_squares
    squares.count { |square| square.is_a? Square }
  end

  def number_of_light_squares
    squares.count { |square| square.light? }
  end
  
  def number_of_dark_squares
    squares.count { |square| square.dark? }
  end

  def all_coordinates
    structure.keys
  end

  def black_white_pattern_at?(rank:)
  end

  def checkered?
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
