class Board
  def initialize(board_maker:, piece_arranger:, move_validator:)
    @board_maker    = board_maker
    @piece_arranger = piece_arranger
    @move_validator = move_validator
    
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

  def piece_on?(coordinate)
    square_on(coordinate).occupied?
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

  def coordinate_references_at(file: nil, rank: nil)
    if file
      coordinates.select { |coordinate| coordinate.file == file }
    elsif rank 
      coordinates.select { |coordinate| coordinate.rank == rank } 
    end
  end

  def top_right_diagonal_references_from(starting_coordinate)
    diagonal = []
    current_coordinate = starting_coordinate

    while current_coordinate
      current_coordinate = current_coordinate.change_coordinate_by(file_amount: 1, rank_amount: 1)
      diagonal << current_coordinate
    end

    diagonal
  end

  def top_left_diagonal_references_from(starting_coordinate)
    diagonal = []
    current_coordinate = starting_coordinate

    while current_coordinate
      current_coordinate = current_coordinate.change_coordinate_by(file_amount: -1, rank_amount: 1)
      diagonal << current_coordinate
    end

    diagonal
  end

  def bottom_right_diagonal_references_from(starting_coordinate)
    diagonal = []
    current_coordinate = starting_coordinate

    while current_coordinate
      current_coordinate = current_coordinate.change_coordinate_by(file_amount: 1, rank_amount: -1)
      diagonal << current_coordinate
    end

    diagonal
  end

  def bottom_left_diagonal_references_from(starting_coordinate)
    diagonal = []
    current_coordinate = starting_coordinate

    while current_coordinate
      current_coordinate = current_coordinate.change_coordinate_by(file_amount: -1, rank_amount: -1)
      diagonal << current_coordinate
    end

    diagonal
  end

  def l_shape_coordinates_from(starting_coordinate)
    l_shape_variations.inject([]) { |result, l_shape_variation| result << starting_coordinate.change_coordinate_by(file_amount: l_shape_variation[0], rank_amount: l_shape_variation[1]) }
  end

  def l_shape_variations
    [ [1, 2], [2, 1], [-1, 2], [-2, 1], [1, -2], [2, -1], [-1, -2], [-2, -1] ]
  end

  def diagonal_coordinates_between(initial_coordinate, destination_coordinate)
    file_number_difference = Coordinate.file_to_number(destination_coordinate.file).to_i - Coordinate.file_to_number(initial_coordinate.file).to_i
    rank_number_difference = destination_coordinate.rank.to_i - initial_coordinate.rank.to_i 

    file_traversal_amount = file_number_difference.positive? ? 1 : -1
    rank_traversal_amount = rank_number_difference.positive? ? 1 : -1

    traversal_coordinate = initial_coordinate
    result = []

    until traversal_coordinate == destination_coordinate
      result << traversal_coordinate

      traversal_coordinate = traversal_coordinate.change_coordinate_by(file_amount: file_traversal_amount, rank_amount: rank_traversal_amount)
    end

    result << destination_coordinate
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
