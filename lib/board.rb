require_relative 'move_validator'

class Board
  def initialize(board_maker, piece_arranger)
    @board_maker    = board_maker
    @piece_arranger = piece_arranger
    @move_validator = MoveValidator.new
    
    @structure = board_maker.make
  end
  
  def empty?
    squares.all?(&:empty?)
  end

  def number_of_squares
    squares.count { |square| square.is_a? Square }
  end

  def number_of_light_squares
    squares.count(&:light?)
  end
  
  def number_of_dark_squares
    squares.count(&:dark?)
  end

  def setup_pieces
    piece_arranger.setup_pieces_on(self)
  end

  def coordinates_at(rank_number:)
    coordinates.select { |coordinate| coordinate.rank == rank_number.to_s }
  end

  def pawn_on?(coordinate)
    square_on(coordinate).pawn_here?
  end

  def rook_on?(coordinate)
    square_on(coordinate).rook_here?
  end

  def knight_on?(coordinate)
    square_on(coordinate).knight_here?
  end

  def bishop_on?(coordinate)
    square_on(coordinate).bishop_here?
  end
  
  def queen_on?(coordinate)
    square_on(coordinate).queen_here?
  end
  
  def king_on?(coordinate)
    square_on(coordinate).king_here?
  end

  def white_piece_on?(coordinate)
    square_on(coordinate).white_piece_here?
  end

  def black_piece_on?(coordinate)
    square_on(coordinate).black_piece_here?
  end

  def place(piece, coordinate)
    square_on(coordinate).host(piece)
  end

  def dark_square_on?(coordinate)
    square_on(coordinate).dark?
  end

  def light_square_on?(coordinate)
    square_on(coordinate).light?
  end

  def same_piece_color_on?(initial_coordinate, destination_coordinate)
    return false if square_on(initial_coordinate).empty? || square_on(destination_coordinate).empty?

    square_on(initial_coordinate).has_piece_with_same_color_as? square_on(destination_coordinate)
  end

  def move_piece(initial_coordinate, destination_coordinate) 
    invalid_move_error_message(destination_coordinate) unless move_validator.valid_move?(initial_coordinate, destination_coordinate, self)

    square_on(initial_coordinate).move_piece_to(destination_coordinate, self)
  end

  private
  
  attr_reader :structure, :board_maker, :piece_arranger, :move_validator

  def invalid_move_error_message(destination_coordinate)
    raise "That piece can't move to #{destination_coordinate.symbol}" 
  end

  def square_on(coordinate)
    structure[coordinate]
  end
  
  def coordinates
    structure.keys
  end

  def squares
    structure.values
  end
end
