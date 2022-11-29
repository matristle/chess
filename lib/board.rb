require_relative 'board_maker'

class Board
  def initialize(board_maker)
    @board_maker = board_maker
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
    board_maker.setup_pieces_on(self)
  end

  def coordinates_at(rank_number:)
    coordinates.select { |coordinate| coordinate.rank == rank_number.to_s }
  end

  def white_piece_here?
    piece.white?
  end

  def black_piece_here?
    piece.black?
  end

  def pawn_at?(coordinate)
    square_at(coordinate).pawn_here?
  end

  def rook_at?(coordinate)
    square_at(coordinate).rook_here?
  end

  def knight_at?(coordinate)
    square_at(coordinate).knight_here?
  end

  def bishop_at?(coordinate)
    square_at(coordinate).bishop_here?
  end
  
  def queen_at?(coordinate)
    square_at(coordinate).queen_here?
  end
  
  def king_at?(coordinate)
    square_at(coordinate).king_here?
  end

  def white_piece_at?(coordinate)
    square_at(coordinate).white_piece_here?
  end

  def black_piece_at?(coordinate)
    square_at(coordinate).black_piece_here?
  end

  def place(piece, coordinate)
    square_at(coordinate).host(piece)
  end

  def dark_square_at?(coordinate)
    square_at(coordinate).dark?
  end

  def light_square_at?(coordinate)
    square_at(coordinate).light?
  end

  def move(piece, current_coordinate, destination_coordinate) 
    place(piece, destination_coordinate)
    square_at(current_coordinate).kick_out_piece
  end

  private
  
  attr_reader :structure, :board_maker
  
  def square_at(coordinate)
    structure[coordinate]
  end

  def coordinates
    structure.keys
  end

  def squares
    structure.values
  end
end
