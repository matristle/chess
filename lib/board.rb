require_relative "fen"

class Board
  class InvalidMoveError < StandardError
    attr_reader :destination_coordinate

    def initialize(destination_coordinate)
      @destination_coordinate = destination_coordinate
    end

    def message
      "That piece can't move to #{destination_coordinate.symbol}"
    end
  end
  class AnotherPieceMovedWhenKingInCheckError < StandardError
    def message
      "Another piece can't be moved while the king is in check"
    end
  end

  def initialize(board_maker:, piece_arranger:, move_validator:)
    @board_maker    = board_maker
    @piece_arranger = piece_arranger
    @move_validator = move_validator
    
    @structure = board_maker.make

  end
  
  def checkmate?(initial_coordinate, destination_coordinate)
    move_validator.king_in_check?(initial_coordinate, self) && move_validator.no_legal_king_moves_left?(initial_coordinate, destination_coordinate, self) && !move_validator.guarding_piece_onto?(destination_coordinate, self, initial_coordinate)
  end

  def stalemate?(initial_coordinate, destination_coordinate)
    move_validator.no_legal_king_moves_left?(initial_coordinate, destination_coordinate, self) && !move_validator.king_in_check?(initial_coordinate, self) 
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

  def no_piece_on?(coordinate)
    square_on(coordinate).empty?
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
    piece_on?(coordinate) && square_on(coordinate).white_piece_here?
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

  def allies?(initial_coordinate, destination_coordinate)
    same_piece_color_on?(initial_coordinate, destination_coordinate)
  end

  def same_piece_color_on?(initial_coordinate, destination_coordinate)
    return false if square_on(initial_coordinate).empty? || square_on(destination_coordinate).empty?

    square_on(initial_coordinate).has_piece_with_same_color_as? square_on(destination_coordinate)
  end

  def piece_has_moved_before_on?(coordinate)
    square_on(coordinate).occupant_has_moved_before?
  end

  def white_king_coordinate
    coordinates.find { |coordinate| square_on(coordinate).king_here? && square_on(coordinate).white_piece_here? }
  end
  
  def black_king_coordinate
    coordinates.find { |coordinate| square_on(coordinate).king_here? && square_on(coordinate).black_piece_here? }
  end

  def move_piece(initial_coordinate, destination_coordinate)
    raise InvalidMoveError.new(destination_coordinate) unless move_validator.valid_move?(initial_coordinate, destination_coordinate, self)
    raise AnotherPieceMovedWhenKingInCheckError if move_validator.king_in_check?(initial_coordinate, self) && !king_on?(initial_coordinate) && !move_validator.partially_pinned_piece_on?(initial_coordinate, destination_coordinate, self) && !move_validator.move_capturing_a_checking_piece?(initial_coordinate, destination_coordinate, self)

    if move_validator.castling_move?(self, initial_coordinate, destination_coordinate)
      a1 = Coordinate.new(:a1); c1 = Coordinate.new(:c1); d1 = Coordinate.new(:d1); e1 = Coordinate.new(:e1); f1 = Coordinate.new(:f1); g1 = Coordinate.new(:g1); h1 = Coordinate.new(:h1)
      a8 = Coordinate.new(:a8); c8 = Coordinate.new(:c8); d8 = Coordinate.new(:d8); e8 = Coordinate.new(:e8); f8 = Coordinate.new(:f8); g8 = Coordinate.new(:g8); h8 = Coordinate.new(:h8)

      if move_validator.short_castling?(self, initial_coordinate, destination_coordinate)
        if white_piece_on?(e1) && white_piece_on?(h1)
          square_on(e1).move_piece_to(g1, self)
          square_on(h1).move_piece_to(f1, self)
        elsif black_piece_on?(e8) && black_piece_on?(h8)
          square_on(e8).move_piece_to(g8, self)
          square_on(h8).move_piece_to(f8, self)
        end
      elsif move_validator.long_castling?(self, initial_coordinate, destination_coordinate)
        if white_piece_on?(e1) && white_piece_on?(a1)
          square_on(e1).move_piece_to(c1, self)
          square_on(a1).move_piece_to(d1, self)
        elsif black_piece_on?(e8) && black_piece_on?(a8)
          square_on(e8).move_piece_to(c8, self)
          square_on(a8).move_piece_to(d8, self)
        end
      end
    else
      square_on(initial_coordinate).move_piece_to(destination_coordinate, self)
    end

    square_on(destination_coordinate).mark_occupant_as_moved_before
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

    diagonal.compact
  end

  def top_left_diagonal_references_from(starting_coordinate)
    diagonal = []
    current_coordinate = starting_coordinate

    while current_coordinate
      current_coordinate = current_coordinate.change_coordinate_by(file_amount: -1, rank_amount: 1)
      diagonal << current_coordinate
    end

    diagonal.compact
  end

  def bottom_right_diagonal_references_from(starting_coordinate)
    diagonal = []
    current_coordinate = starting_coordinate

    while current_coordinate
      current_coordinate = current_coordinate.change_coordinate_by(file_amount: 1, rank_amount: -1)
      diagonal << current_coordinate
    end

    diagonal.compact
  end

  def bottom_left_diagonal_references_from(starting_coordinate)
    diagonal = []
    current_coordinate = starting_coordinate

    while current_coordinate
      current_coordinate = current_coordinate.change_coordinate_by(file_amount: -1, rank_amount: -1)
      diagonal << current_coordinate
    end

    diagonal.compact
  end

  def l_shape_coordinates_from(starting_coordinate)
    l_shape_variations.inject([]) { |result, l_shape_variation| result << starting_coordinate.change_coordinate_by(file_amount: l_shape_variation[0], rank_amount: l_shape_variation[1]) }.compact
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

  def to_fen
    @empty_square_count    = 0
    @occupied_square_count = 0
    @piece_placement_data       = ""
    @castling_availability_data = ""

    collect_piece_placement_data
    collect_castling_availability_data

    FEN.new(piece_placement_data, castling_availability_data)
  end

  def checker_color_values
    board.collect_checker_color_values
  end

  def collect_checker_color_values
    fen_coordinates.collect do |rank|
      rank.collect do |coordinate|
        square_on(coordinate).light? ? :light : :dark 
      end
    end
  end

  private
  
  attr_reader :structure, :board_maker, :piece_arranger, :move_validator, :fen_sequence, :empty_square_count, :occupied_square_count, :piece_placement_data, :castling_availability_data

  def fen_coordinates
    ("1".."8").to_a.reverse.map do |rank_number|
      coordinate_references_at(rank: rank_number)
    end
  end

  def collect_piece_placement_data
    fen_coordinates.each do |rank|
      rank.each do |coordinate|
        if no_piece_on?(coordinate)
          @empty_square_count += 1
        else
          @occupied_square_count += 1

          if rook_on?(coordinate)
            if white_piece_on?(coordinate)
              piece_symbol = "R"
            else
              piece_symbol = "r"
            end
          elsif knight_on?(coordinate)
            if white_piece_on?(coordinate)
              piece_symbol = "N"
            else
              piece_symbol = "n"
            end
          elsif bishop_on?(coordinate)
            if white_piece_on?(coordinate)
              piece_symbol = "B"
            else
              piece_symbol = "b"
            end
          elsif queen_on?(coordinate)
            if white_piece_on?(coordinate)
              piece_symbol = "Q"
            else
              piece_symbol = "q"
            end
          elsif king_on?(coordinate)
            if white_piece_on?(coordinate)
              piece_symbol = "K"
            else
              piece_symbol = "k"
            end
          end

          if coordinate.file == "a"
            @piece_placement_data << piece_symbol
          else
            @piece_placement_data << empty_square_count.to_s unless empty_square_count == 0
            @piece_placement_data << piece_symbol

            @empty_square_count = 0
          end
        end
        
        if coordinate.file == "h"
          if empty_square_count == 8
            @piece_placement_data << empty_square_count.to_s << rank_separator
          else
            current_rank_info = piece_placement_data.split("/")[-1]
            current_rank_info = "" unless current_rank_info

            @piece_placement_data << empty_square_count.to_s << rank_separator unless empty_square_count == 0

            @piece_placement_data << rank_separator if empty_square_count == 0
          end

          @empty_square_count = 0
        end
      end
    end

    eliminate_extra_slashes_in_piece_placement_data
  end

  def collect_castling_availability_data
    c8 = Coordinate.new(:c8); e8 = Coordinate.new(:e8); g8 = Coordinate.new(:g8)
    c1 = Coordinate.new(:c1); e1 = Coordinate.new(:e1); g1 = Coordinate.new(:g1)

    @castling_availability_data << "K" if move_validator.short_castling?(self , e1, g1)  && white_piece_on?(e1)
    @castling_availability_data << "Q" if move_validator.long_castling?( self , e1, c1)  && white_piece_on?(e1)
    @castling_availability_data << "k" if move_validator.short_castling?(self , e8, g8)  && black_piece_on?(e8)
    @castling_availability_data << "q" if move_validator.long_castling?( self , e8, c8)  && black_piece_on?(e8)
    @castling_availability_data << "-" unless (move_validator.short_castling?(self , e1, g1)  && white_piece_on?(e1)) || (move_validator.long_castling?( self , e1, c1)  && white_piece_on?(e1)) || (move_validator.short_castling?(self , e8, g8)  && black_piece_on?(e8)) || (move_validator.long_castling?( self , e8, c8)  && black_piece_on?(e8))

    eliminate_extra_whitespace_in_castling_availability_data
  end

  def eliminate_extra_whitespace_in_castling_availability_data
    if castling_availability_data.end_with?(" ")
      castling_availability_data.delete_suffix!(" ")
    end
  end

  def eliminate_extra_slashes_in_piece_placement_data
    if piece_placement_data.start_with?("/")
      piece_placement_data.delete_prefix!("/")
    elsif piece_placement_data.end_with?("/")
      piece_placement_data.delete_suffix!("/")
    end
  end

  def rank_separator
    "/"
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
