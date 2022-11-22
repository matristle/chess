require_relative 'board_maker'

class Board
  def initialize
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

  def checkered?
    (1..8).each.all? do |rank_number|
      if rank_number.odd?
        dark_light_pattern_at?(rank_number:)
      else 
        light_dark_pattern_at?(rank_number:)
      end
    end
  end

  def setup_pieces
    BoardMaker.set_of_chess_pieces.each do |piece|
      setup(piece)
    end
  end

  def setup(piece)
    case piece
    when :pawn
      coordinate_references_at(rank_number: 2).each do |coordinate|
        target_square = structure[coordinate]

        target_square.host(piece)
      end
    when :rook
      structure[Coordinate.new(:a1)].host(piece)
      structure[Coordinate.new(:h1)].host(piece)
    when :knight
      structure[Coordinate.new(:b1)].host(piece)
      structure[Coordinate.new(:g1)].host(piece)
    when :bishop
      structure[Coordinate.new(:c1)].host(piece)
      structure[Coordinate.new(:f1)].host(piece)
    when :queen
      structure[Coordinate.new(:d1)].host(piece)
    when :king
      structure[Coordinate.new(:e1)].host(piece)
    end
  end

  private
  
  attr_reader :structure
  
  def board_maker
    @board_maker ||= BoardMaker.new
  end

  def coordinates
    structure.keys
  end

  def squares
    structure.values
  end

  def dark_light_pattern_at?(rank_number:)
    dark_on_odd_number_squares?(rank_number:) && light_on_even_number_squares?(rank_number:)
  end

  def dark_on_odd_number_squares?(rank_number:)
    odd_number_squares_at(rank_number:).all? { |coordinate| square_at(coordinate).dark? }
  end

  def light_on_even_number_squares?(rank_number:)
    even_number_squares_at(rank_number:).all? { |coordinate| square_at(coordinate).light? }
  end

  def light_dark_pattern_at?(rank_number:)
    light_on_odd_number_squares?(rank_number:) && dark_on_even_number_squares?(rank_number:)
  end

  def light_on_odd_number_squares?(rank_number:)
    odd_number_squares_at(rank_number:).all? { |coordinate| square_at(coordinate).light? }
  end

  def dark_on_even_number_squares?(rank_number:)
    even_number_squares_at(rank_number:).all? { |coordinate| square_at(coordinate).dark? }
  end

  def odd_number_squares_at(rank_number:)
    coordinate_references_at(rank_number:).select { |coordinate| Coordinate.file_to_number(coordinate.file).to_i.odd?  }
  end
  
  def even_number_squares_at(rank_number:)
    coordinate_references_at(rank_number:).select { |coordinate| Coordinate.file_to_number(coordinate.file).to_i.even? }
  end

  def coordinate_references_at(rank_number:)
    coordinates(structure).select { |coordinate| coordinate.rank == rank_number.to_s }
  end

  def coordinates(board)
    board.keys
  end
end
