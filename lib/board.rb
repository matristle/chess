require_relative 'piece_arranger'

class Board
  def initialize(board_maker, piece_arranger)
    @board_maker    = board_maker
    @piece_arranger = piece_arranger
    
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

  def move_piece(current_coordinate, destination_coordinate)
    if square_on(current_coordinate).rook_here? || square_on(current_coordinate).knight_here?
      unless rook_move?(current_coordinate, destination_coordinate) || knight_move?(current_coordinate, destination_coordinate)
        raise "That piece can't move to #{destination_coordinate.symbol}" 
      end
    end

    square_on(current_coordinate).move_piece_to(destination_coordinate, self)
  end

  private
  
  attr_reader :structure, :board_maker, :piece_arranger

  def rook_move?(current_coordinate, destination_coordinate)
    same_file_or_rank?(current_coordinate, destination_coordinate)
  end

  def same_file_or_rank?(current_coordinate, destination_coordinate)
    current_coordinate.file == destination_coordinate.file || current_coordinate.rank == destination_coordinate.rank
  end

  def knight_move?(current_coordinate, destination_coordinate)
    two_up_one_right?(current_coordinate, destination_coordinate)   || one_up_two_right?(current_coordinate, destination_coordinate)   || two_up_one_left?(current_coordinate, destination_coordinate)   || one_up_two_left?(current_coordinate, destination_coordinate) ||
    two_down_one_right?(current_coordinate, destination_coordinate) || one_down_two_right?(current_coordinate, destination_coordinate) || two_down_one_left?(current_coordinate, destination_coordinate) || one_down_two_left?(current_coordinate, destination_coordinate)
  end

  def two_up_one_right?(current_coordinate, destination_coordinate)
    traversal_rank = (current_coordinate.rank.to_i + 2).to_s
    traversal_file_number = (Coordinate.file_to_number(current_coordinate.file).to_i + 1).to_s
    traversal_file = Coordinate.number_to_file(traversal_file_number).to_s
    traversal_symbol = (traversal_file + traversal_rank).to_sym

    traversal_symbol == destination_coordinate.symbol
  end
  
  def one_up_two_right?(current_coordinate, destination_coordinate)
    traversal_rank = (current_coordinate.rank.to_i + 1).to_s
    traversal_file_number = (Coordinate.file_to_number(current_coordinate.file).to_i + 2).to_s
    traversal_file = Coordinate.number_to_file(traversal_file_number).to_s
    traversal_symbol = (traversal_file + traversal_rank).to_sym

    traversal_symbol == destination_coordinate.symbol
  end

  def two_up_one_left?(current_coordinate, destination_coordinate)
    traversal_rank = (current_coordinate.rank.to_i + 2).to_s
    traversal_file_number = (Coordinate.file_to_number(current_coordinate.file).to_i - 1).to_s
    traversal_file = Coordinate.number_to_file(traversal_file_number).to_s
    traversal_symbol = (traversal_file + traversal_rank).to_sym

    traversal_symbol == destination_coordinate.symbol
  end

  def one_up_two_left?(current_coordinate, destination_coordinate)
    traversal_rank = (current_coordinate.rank.to_i + 1).to_s
    traversal_file_number = (Coordinate.file_to_number(current_coordinate.file).to_i - 2).to_s
    traversal_file = Coordinate.number_to_file(traversal_file_number).to_s
    traversal_symbol = (traversal_file + traversal_rank).to_sym

    traversal_symbol == destination_coordinate.symbol
  end

  def two_down_one_right?(current_coordinate, destination_coordinate)
    traversal_rank = (current_coordinate.rank.to_i - 2).to_s
    traversal_file_number = (Coordinate.file_to_number(current_coordinate.file).to_i + 1).to_s
    traversal_file = Coordinate.number_to_file(traversal_file_number).to_s
    traversal_symbol = (traversal_file + traversal_rank).to_sym

    traversal_symbol == destination_coordinate.symbol
  end

  def one_down_two_right?(current_coordinate, destination_coordinate)
    traversal_rank = (current_coordinate.rank.to_i - 1).to_s
    traversal_file_number = (Coordinate.file_to_number(current_coordinate.file).to_i + 2).to_s
    traversal_file = Coordinate.number_to_file(traversal_file_number).to_s
    traversal_symbol = (traversal_file + traversal_rank).to_sym

    traversal_symbol == destination_coordinate.symbol
  end

  def two_down_one_left?(current_coordinate, destination_coordinate)
    traversal_rank = (current_coordinate.rank.to_i - 2).to_s
    traversal_file_number = (Coordinate.file_to_number(current_coordinate.file).to_i - 1).to_s
    traversal_file = Coordinate.number_to_file(traversal_file_number).to_s
    traversal_symbol = (traversal_file + traversal_rank).to_sym

    traversal_symbol == destination_coordinate.symbol
  end

  def one_down_two_left?(current_coordinate, destination_coordinate)
    traversal_rank = (current_coordinate.rank.to_i - 1).to_s
    traversal_file_number = (Coordinate.file_to_number(current_coordinate.file).to_i - 2).to_s
    traversal_file = Coordinate.number_to_file(traversal_file_number).to_s
    traversal_symbol = (traversal_file + traversal_rank).to_sym

    traversal_symbol == destination_coordinate.symbol
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
