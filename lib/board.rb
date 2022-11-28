require_relative 'board_maker'

class Board
  def initialize(board_maker)
    @board_maker = board_maker
    @structure = board_maker.make
  end

  def square_at(coordinate)
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

  def setup_pieces
    board_maker.setup_pieces_on(self)
  end

  def coordinates_at(rank_number:)
    coordinates.select { |coordinate| coordinate.rank == rank_number.to_s }
  end

  private
  
  attr_reader :structure, :board_maker
  
  def coordinates
    structure.keys
  end

  def squares
    structure.values
  end
end
