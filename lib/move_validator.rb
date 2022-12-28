class MoveValidator
  class StationaryMoveError < StandardError
    def message
      "That move doesn't go anywhere else"
    end
  end
  class IntoOpponentMovesetError < StandardError
    def message
      "The king can't move into an opponent's piece moveset"
    end
  end
  class CapturedKingError < StandardError
    def message
      "The king can't be captured/replaced"
    end
  end
  class CapturedAllyError < StandardError
    attr_reader :initial_coordinate, :destination_coordinate
    
    def initialize(initial_coordinate, destination_coordinate)
      @initial_coordinate     = initial_coordinate
      @destination_coordinate = destination_coordinate
    end
    
    def message
      "The piece on #{destination_coordinate.symbol} is an ally, so the piece at #{initial_coordinate.symbol} can't replace it"
    end
  end
  class InterveningPieceError < StandardError
    attr_reader :initial_coordinate, :destination_coordinate
    
    def initialize(initial_coordinate, destination_coordinate)
      @initial_coordinate     = initial_coordinate
      @destination_coordinate = destination_coordinate
    end
    
    def message
      "The move is invalid since there's an intervening piece between #{initial_coordinate.symbol} and #{destination_coordinate.symbol}"
    end
  end
  class MovedPinnedPieceError < StandardError
    attr_reader :destination_coordinate
    
    def initialize(destination_coordinate)
      @destination_coordinate = destination_coordinate
    end
    
    def message
      "That piece is pinned to the king and can't be moved to #{destination_coordinate.symbol}"
    end
  end
  class CastlingWhenInCheckError < StandardError
    def message
      "The king can't castle because it's in check"
    end
  end
  class PreviouslyMovedKingCastlingError < StandardError
    def message
      "The king can't castle because it has moved before" 
    end
  end
  class PreviouslyMovedRookCastlingError < StandardError
    def message
      "The king can't castle because the rook has moved before"
    end
  end
  class CastlingThroughGuardedSquareError < StandardError
    def message
      "The king can't castle through a guarded square"
    end
  end
  

  def valid_move?(initial_coordinate, destination_coordinate, board)
    check_for_stationary_move(initial_coordinate, destination_coordinate)
    check_for_imminent_captured_king_on(destination_coordinate, board)
    check_for_imminent_ally_piece_capturing_from(initial_coordinate, destination_coordinate, board)
    check_for_intervening_pieces_between(initial_coordinate, destination_coordinate, board)
    check_for_pinned_piece(initial_coordinate, destination_coordinate, board)
    validate_based_on_piece(initial_coordinate, destination_coordinate, board)
  end

  def any_intervening_piece_between?(initial_coordinate, destination_coordinate, board)
    return false unless initial_coordinate && destination_coordinate
    return false if one_step?(initial_coordinate, destination_coordinate)

    traversal_coordinates(initial_coordinate, destination_coordinate, board).any? { |traversal_coordinate| board.piece_on? traversal_coordinate }
  end

  def absolutely_pinned_piece_on?(initial_coordinate, destination_coordinate, board)
    return false if coinciding_moveset?(initial_coordinate, destination_coordinate, board)

    king_in_check?(initial_coordinate, destination_coordinate, board) && ( any_intervening_piece_between?(board.white_king_coordinate, found_piece_coordinate, board) || any_intervening_piece_between?(board.black_king_coordinate, found_piece_coordinate, board) )
  end

  def partially_pinned_piece_on?(initial_coordinate, destination_coordinate, board)
    coinciding_moveset?(initial_coordinate, destination_coordinate, board) && king_in_check?(initial_coordinate, destination_coordinate, board) && ( any_intervening_piece_between?(board.white_king_coordinate, found_piece_coordinate, board) || any_intervening_piece_between?(board.black_king_coordinate, found_piece_coordinate, board) )
  end

  def no_legal_king_moves_left?(initial_coordinate, destination_coordinate, board)
    if board.white_piece_on?(destination_coordinate)
      king_traversal_coordinates(board.black_king_coordinate, board).none? do |traversal_coordinate|
        valid_move?(board.black_king_coordinate, traversal_coordinate, board)

      rescue IntoOpponentMovesetError, CapturedKingError, CapturedAllyError, InterveningPieceError, MovedPinnedPieceError, CastlingWhenInCheckError, PreviouslyMovedKingCastlingError, PreviouslyMovedRookCastlingError, CastlingThroughGuardedSquareError, StationaryMoveError
        false
      end
    elsif board.black_piece_on?(destination_coordinate)
      king_traversal_coordinates(board.white_king_coordinate, board).none? do |traversal_coordinate|
        valid_move?(board.white_king_coordinate, traversal_coordinate, board)

      rescue IntoOpponentMovesetError, CapturedKingError, CapturedAllyError, InterveningPieceError, MovedPinnedPieceError, CastlingWhenInCheckError, PreviouslyMovedKingCastlingError, PreviouslyMovedRookCastlingError, CastlingThroughGuardedSquareError, StationaryMoveError
        false
      end
    end
  end

  def castling_move?(board, initial_coordinate, destination_coordinate)
    short_castling?(board, initial_coordinate, destination_coordinate) || long_castling?(board, initial_coordinate, destination_coordinate)
  end

  def short_castling?(board, initial_coordinate, destination_coordinate)
    e1 = Coordinate.new(:e1); f1 = Coordinate.new(:f1); g1 = Coordinate.new(:g1); h1 = Coordinate.new(:h1)
    e8 = Coordinate.new(:e8); f8 = Coordinate.new(:f8); g8 = Coordinate.new(:g8); h8 = Coordinate.new(:h8)

    return false unless (initial_coordinate == e1 && destination_coordinate == g1) || (initial_coordinate == e8 && destination_coordinate == g8)

    raise PreviouslyMovedKingCastlingError if (initial_coordinate == e1 && board.white_piece_on?(e1) && board.king_on?(e1) && board.piece_has_moved_before_on?(e1)) || (initial_coordinate == e8 && board.black_piece_on?(e8) && board.king_on?(e8) && board.piece_has_moved_before_on?(e8))
    raise PreviouslyMovedRookCastlingError if (initial_coordinate == e1 && board.white_piece_on?(h1) && board.rook_on?(h1) && board.piece_has_moved_before_on?(h1)) || (initial_coordinate == e8 && board.black_piece_on?(h8) && board.rook_on?(h8) && board.piece_has_moved_before_on?(h8))

    if board.white_piece_on?(e1) && board.white_piece_on?(h1)
      raise CastlingThroughGuardedSquareError if guarding_piece_on?(f1, board, e1)
      
      board.king_on?(e1) && board.rook_on?(h1)
    elsif board.black_piece_on?(e8) && board.black_piece_on?(h8)
      raise CastlingThroughGuardedSquareError if guarding_piece_on?(f8, board, e8)

      board.king_on?(e8) && board.rook_on?(h8)
    end
  end

  def long_castling?(board, initial_coordinate, destination_coordinate)
    a1 = Coordinate.new(:a1); c1 = Coordinate.new(:c1); d1 = Coordinate.new(:d1); e1 = Coordinate.new(:e1)
    a8 = Coordinate.new(:a8); c8 = Coordinate.new(:c8); d8 = Coordinate.new(:d8); e8 = Coordinate.new(:e8)

    return false unless (initial_coordinate == e1 && destination_coordinate == c1) || (initial_coordinate == e8 && destination_coordinate == c8)

    raise PreviouslyMovedKingCastlingError if (board.piece_on?(e1) && board.piece_has_moved_before_on?(e1)) || (board.piece_on?(e8) && board.piece_has_moved_before_on?(e8))
    raise PreviouslyMovedRookCastlingError if (board.piece_on?(a1) && board.piece_has_moved_before_on?(a1)) || (board.piece_on?(a8) && board.piece_has_moved_before_on?(a8))

    if board.white_piece_on?(e1) && board.white_piece_on?(a1)
      raise CastlingThroughGuardedSquareError if guarding_piece_on?(d1, board, e1)
      
      board.king_on?(e1) && board.rook_on?(a1) 
    elsif board.black_piece_on?(e8) && board.black_piece_on?(a8)
      raise CastlingThroughGuardedSquareError if guarding_piece_on?(d8, board, e8)

      board.king_on?(e8) && board.rook_on?(a8)
    end
  end

  def king_in_check?(initial_coordinate, destination_coordinate, board)
    white_king_in_check?(initial_coordinate, destination_coordinate, board) || black_king_in_check?(initial_coordinate, destination_coordinate, board)
  end

  def white_king_in_check?(initial_coordinate, destination_coordinate, board)
    guarding_piece_on?(board.white_king_coordinate, board, initial_coordinate)
  end

  def black_king_in_check?(initial_coordinate, destination_coordinate, board)
    guarding_piece_on?(board.black_king_coordinate, board, initial_coordinate)
  end

  private

  attr_reader :found_piece_coordinate

  def validate_based_on_piece(initial_coordinate, destination_coordinate, board)
    if board.rook_on?(initial_coordinate)
      rook_move?(initial_coordinate, destination_coordinate)
    elsif board.knight_on?(initial_coordinate)
      knight_move?(initial_coordinate, destination_coordinate)
    elsif board.bishop_on?(initial_coordinate)
      bishop_move?(initial_coordinate, destination_coordinate)
    elsif board.queen_on?(initial_coordinate)
      queen_move?(initial_coordinate, destination_coordinate)
    elsif board.king_on?(initial_coordinate)
      check_for_guarding_piece_on(destination_coordinate, board, initial_coordinate)
      check_for_castling_when_king_is_in_check(initial_coordinate, destination_coordinate, board)
      return true if castling_move?(board, initial_coordinate, destination_coordinate)
      king_move?(initial_coordinate, destination_coordinate)
    end
  end

  def check_for_stationary_move(initial_coordinate, destination_coordinate)
    raise StationaryMoveError if stationary_move?(initial_coordinate, destination_coordinate)
  end
  
  def stationary_move?(initial_coordinate, destination_coordinate)
    initial_coordinate == destination_coordinate
  end

  def check_for_castling_when_king_is_in_check(initial_coordinate, destination_coordinate, board)
    raise CastlingWhenInCheckError if castling_move?(board, initial_coordinate, destination_coordinate) && king_in_check?(initial_coordinate, destination_coordinate, board) && board.king_on?(initial_coordinate) 
  end

  def check_for_pinned_piece(initial_coordinate, destination_coordinate, board)
    raise MovedPinnedPieceError.new(destination_coordinate) if absolutely_pinned_piece_on?(initial_coordinate, destination_coordinate, board)
  end

  def traversal_coordinates(initial_coordinate, destination_coordinate, board)
    if rook_move?(initial_coordinate, destination_coordinate)
      if same_rank?(initial_coordinate, destination_coordinate)
        result = board.coordinate_references_at(rank: initial_coordinate.rank)
      else
        result = board.coordinate_references_at(file: initial_coordinate.file)
      end

      result = discard_boundary_coordinates(result, initial_coordinate, destination_coordinate)
    elsif bishop_move?(initial_coordinate, destination_coordinate)
      result = board.diagonal_coordinates_between(initial_coordinate, destination_coordinate)
      result = discard_boundary_coordinates(result, initial_coordinate, destination_coordinate)
    else
      result = []
    end
  end

  def king_traversal_coordinates(initial_coordinate, board)
    variations = [0, -1, 1].repeated_permutation(2).to_a - [ [0, 0] ]

    result = variations.map { |variation| initial_coordinate.change_coordinate_by(file_amount: variation[0], rank_amount: variation[1]) }.compact
  end

  def check_for_imminent_captured_king_on(destination_coordinate, board)
    raise CapturedKingError if board.king_on? destination_coordinate
  end

  def check_for_imminent_ally_piece_capturing_from(initial_coordinate, destination_coordinate, board)
    raise CapturedAllyError.new(initial_coordinate, destination_coordinate) if board.same_piece_color_on?(initial_coordinate, destination_coordinate)
  end

  def check_for_intervening_pieces_between(initial_coordinate, destination_coordinate, board)
    raise InterveningPieceError.new(initial_coordinate, destination_coordinate) if any_intervening_piece_between?(initial_coordinate, destination_coordinate, board)
  end

  def check_for_guarding_piece_on(destination_coordinate, board, initial_coordinate)
    raise IntoOpponentMovesetError if guarding_piece_on?(destination_coordinate, board, initial_coordinate)
  end

  def coinciding_moveset?(initial_coordinate, destination_coordinate, board)
    # finding the piece coordinate is as of now coupled to #guarding_piece_on? and if not used will result in a nil found_piece_coordinate -- a coordinate finding method will be extracted later
    guarding_piece_on?(board.white_king_coordinate, board, initial_coordinate) || guarding_piece_on?(board.black_king_coordinate, board, initial_coordinate)

    return false unless found_piece_coordinate

    ( bishop_move?(initial_coordinate, destination_coordinate) && board.bishop_on?(found_piece_coordinate) ) || ( bishop_move?(initial_coordinate, destination_coordinate) && board.queen_on?(found_piece_coordinate) ) &&
    ( rook_move?(initial_coordinate, destination_coordinate)   && board.rook_on?(found_piece_coordinate)   ) || ( rook_move?(initial_coordinate, destination_coordinate)   && board.queen_on?(found_piece_coordinate) )
  end

  def guarding_piece_on?(destination_coordinate, board, initial_coordinate)
    return false unless destination_coordinate
    
    guarding_piece_on_file_or_rank?(destination_coordinate, board, initial_coordinate) || guarding_piece_on_diagonals?(destination_coordinate, board, initial_coordinate) ||
    guarding_knight_on(destination_coordinate, board, initial_coordinate)
  end
  
  def guarding_piece_on_file_or_rank?(destination_coordinate, board, initial_coordinate)
    guarding_piece_on_file?(destination_coordinate, board, initial_coordinate) || guarding_piece_on_rank?(destination_coordinate, board, initial_coordinate) 
  end

  def guarding_piece_on_file?(destination_coordinate, board, initial_coordinate)
    destination_file = board.coordinate_references_at(file: destination_coordinate.file)
    split_point_index = destination_file.index(destination_coordinate)
    leftside_file, rightside_file = destination_file[0...split_point_index], destination_file[split_point_index+1..-1]
    leftside_file.delete(initial_coordinate)
    rightside_file.delete(initial_coordinate)
    leftside_file.delete(destination_coordinate)
    rightside_file.delete(destination_coordinate)

    @found_piece_coordinate = leftside_file.find  { |coordinate| board.piece_on? coordinate }
    @found_piece_coordinate = rightside_file.find { |coordinate| board.piece_on? coordinate } unless found_piece_coordinate

    if found_piece_coordinate
      return false if board.same_piece_color_on?(initial_coordinate, found_piece_coordinate)

      board.rook_on?(found_piece_coordinate) || board.queen_on?(found_piece_coordinate) || board.king_on?(found_piece_coordinate) 
    end
  end

  def guarding_piece_on_rank?(destination_coordinate, board, initial_coordinate)
    destination_rank = board.coordinate_references_at(rank: destination_coordinate.rank)
    split_point_index = destination_rank.index(destination_coordinate)
    leftside_rank, rightside_rank = destination_rank[0...split_point_index], destination_rank[split_point_index+1..-1]
    leftside_rank.delete(initial_coordinate)
    rightside_rank.delete(initial_coordinate)
    leftside_rank.delete(destination_coordinate)
    rightside_rank.delete(destination_coordinate)

    @found_piece_coordinate = leftside_rank.find  { |coordinate| board.piece_on? coordinate }
    @found_piece_coordinate = rightside_rank.find { |coordinate| board.piece_on? coordinate } unless found_piece_coordinate

    if found_piece_coordinate
      return false if board.same_piece_color_on?(initial_coordinate, found_piece_coordinate)
      
      board.rook_on?(found_piece_coordinate) || board.queen_on?(found_piece_coordinate) || board.king_on?(found_piece_coordinate)
    end
  end
  
  def guarding_piece_on_diagonals?(destination_coordinate, board, initial_coordinate)
    guarding_piece_on_top_right_diagonal?(destination_coordinate, board, initial_coordinate)    || guarding_piece_on_top_left_diagonal?(destination_coordinate, board, initial_coordinate) ||
    guarding_piece_on_bottom_right_diagonal?(destination_coordinate, board, initial_coordinate) || guarding_piece_on_bottom_left_diagonal?(destination_coordinate, board, initial_coordinate)
  end
  
  def guarding_piece_on_top_right_diagonal?(destination_coordinate, board, initial_coordinate)
    top_right_diagonal = board.top_right_diagonal_references_from(destination_coordinate)
    top_right_diagonal.delete(initial_coordinate)
    @found_piece_coordinate = top_right_diagonal.find { |coordinate| board.piece_on? coordinate }

    if found_piece_coordinate
      return false if board.same_piece_color_on?(initial_coordinate, found_piece_coordinate)
      
      board.bishop_on?(found_piece_coordinate) || board.queen_on?(found_piece_coordinate) || board.king_on?(found_piece_coordinate)
    end
  end
  
  def guarding_piece_on_top_left_diagonal?(destination_coordinate, board, initial_coordinate)
    top_left_diagonal = board.top_left_diagonal_references_from(destination_coordinate)
    top_left_diagonal.delete(initial_coordinate)
    @found_piece_coordinate = top_left_diagonal.find { |coordinate| board.piece_on? coordinate }

    if found_piece_coordinate
      return false if board.same_piece_color_on?(initial_coordinate, found_piece_coordinate)
      
      board.bishop_on?(found_piece_coordinate) || board.queen_on?(found_piece_coordinate) || board.king_on?(found_piece_coordinate)
    end
  end
  
  def guarding_piece_on_bottom_right_diagonal?(destination_coordinate, board, initial_coordinate)
    bottom_right_diagonal = board.bottom_right_diagonal_references_from(destination_coordinate)
    bottom_right_diagonal.delete(initial_coordinate)
    @found_piece_coordinate = bottom_right_diagonal.find { |coordinate| board.piece_on? coordinate }

    if found_piece_coordinate
      return false if board.same_piece_color_on?(initial_coordinate, found_piece_coordinate)
      
      board.bishop_on?(found_piece_coordinate) || board.queen_on?(found_piece_coordinate) || board.king_on?(found_piece_coordinate)
    end
  end
  
  def guarding_piece_on_bottom_left_diagonal?(destination_coordinate, board, initial_coordinate)
    bottom_left_diagonal = board.bottom_left_diagonal_references_from(destination_coordinate)
    bottom_left_diagonal.delete(initial_coordinate)
    @found_piece_coordinate = bottom_left_diagonal.find { |coordinate| board.piece_on? coordinate }

    if found_piece_coordinate
      return false if board.same_piece_color_on?(initial_coordinate, found_piece_coordinate)
      
      board.bishop_on?(found_piece_coordinate) || board.queen_on?(found_piece_coordinate) || board.king_on?(found_piece_coordinate)
    end
  end
  
  def guarding_knight_on(destination_coordinate, board, initial_coordinate)
    l_shapes = board.l_shape_coordinates_from(destination_coordinate)
    @found_piece_coordinate = l_shapes.find { |coordinate| board.piece_on? coordinate }
    
    if found_piece_coordinate
      return false if board.same_piece_color_on?(initial_coordinate, found_piece_coordinate)
      
      board.knight_on?(found_piece_coordinate)
    end
  end

  def discard_boundary_coordinates(traversal_coordinates, initial_coordinate, destination_coordinate)
    initial_coordinate_index     = traversal_coordinates.index(initial_coordinate)
    destination_coordinate_index = traversal_coordinates.index(destination_coordinate)

    if rook_move?(initial_coordinate, destination_coordinate)
      if Coordinate.file_difference(destination_coordinate.file, initial_coordinate.file) > 0 || Coordinate.rank_difference(destination_coordinate.rank, initial_coordinate.rank) > 0
        result = traversal_coordinates[initial_coordinate_index+1..destination_coordinate_index-1]
      else
        result = traversal_coordinates[destination_coordinate_index+1..initial_coordinate_index-1]
      end
    else bishop_move?(initial_coordinate, destination_coordinate)
      if Coordinate.file_difference(destination_coordinate.file, initial_coordinate.file) > 0 || Coordinate.rank_difference(destination_coordinate.rank, initial_coordinate.rank) > 0
        result = traversal_coordinates[initial_coordinate_index+1..destination_coordinate_index-1]
      else
        result = traversal_coordinates.reverse[initial_coordinate_index+1..destination_coordinate_index-1]
      end
    end
    
    result
  end

  def king_move?(initial_coordinate, destination_coordinate)
    queen_move?(initial_coordinate, destination_coordinate) && one_step?(initial_coordinate, destination_coordinate)
  end

  def one_step?(initial_coordinate, destination_coordinate)
    Coordinate.file_difference(initial_coordinate.file, destination_coordinate.file).abs == 1 || Coordinate.rank_difference(initial_coordinate.rank, destination_coordinate.rank).abs == 1
  end

  def queen_move?(initial_coordinate, destination_coordinate)
    rook_move?(initial_coordinate, destination_coordinate) || bishop_move?(initial_coordinate, destination_coordinate)
  end

  def rook_move?(initial_coordinate, destination_coordinate)
    same_file_or_rank?(initial_coordinate, destination_coordinate)
  end

  def same_file_or_rank?(initial_coordinate, destination_coordinate)
    same_file?(initial_coordinate, destination_coordinate) || same_rank?(initial_coordinate, destination_coordinate)
  end

  def same_file?(initial_coordinate, destination_coordinate)
    initial_coordinate.file == destination_coordinate.file
  end

  def same_rank?(initial_coordinate, destination_coordinate)
    initial_coordinate.rank == destination_coordinate.rank
  end

  def knight_move?(initial_coordinate, destination_coordinate)
    two_up_one_right?(initial_coordinate, destination_coordinate)   || one_up_two_right?(initial_coordinate, destination_coordinate)   || two_up_one_left?(initial_coordinate, destination_coordinate)   || one_up_two_left?(initial_coordinate, destination_coordinate) ||
    two_down_one_right?(initial_coordinate, destination_coordinate) || one_down_two_right?(initial_coordinate, destination_coordinate) || two_down_one_left?(initial_coordinate, destination_coordinate) || one_down_two_left?(initial_coordinate, destination_coordinate)
  end

  def bishop_move?(initial_coordinate, destination_coordinate)
    diagonal_move?(initial_coordinate, destination_coordinate)
  end

  def diagonal_move?(initial_coordinate, destination_coordinate)
    same_number_of_file_and_rank_steps?(initial_coordinate, destination_coordinate)
  end

  def same_number_of_file_and_rank_steps?(initial_coordinate, destination_coordinate)
    Coordinate.file_difference(initial_coordinate.file, destination_coordinate.file).abs == Coordinate.rank_difference(initial_coordinate.rank, destination_coordinate.rank).abs
  end

  def two_up_one_right?(initial_coordinate, destination_coordinate)
    traversal_coordinate = initial_coordinate.change_coordinate_by(file_amount: 1, rank_amount: 2)
 
    traversal_coordinate == destination_coordinate
  end
  
  def one_up_two_right?(initial_coordinate, destination_coordinate)
    traversal_coordinate = initial_coordinate.change_coordinate_by(file_amount: 2, rank_amount: 1)
 
    traversal_coordinate == destination_coordinate
  end

  def two_up_one_left?(initial_coordinate, destination_coordinate)
    traversal_coordinate = initial_coordinate.change_coordinate_by(file_amount: -1, rank_amount: 2)
 
    traversal_coordinate == destination_coordinate
  end

  def one_up_two_left?(initial_coordinate, destination_coordinate)
    traversal_coordinate = initial_coordinate.change_coordinate_by(file_amount: -2, rank_amount: 1)
 
    traversal_coordinate == destination_coordinate
  end

  def two_down_one_right?(initial_coordinate, destination_coordinate)
    traversal_coordinate = initial_coordinate.change_coordinate_by(file_amount: 1, rank_amount: -2)
 
    traversal_coordinate == destination_coordinate
  end

  def one_down_two_right?(initial_coordinate, destination_coordinate)
    traversal_coordinate = initial_coordinate.change_coordinate_by(file_amount: 2, rank_amount: -1)
 
    traversal_coordinate == destination_coordinate
  end

  def two_down_one_left?(initial_coordinate, destination_coordinate)
    traversal_coordinate = initial_coordinate.change_coordinate_by(file_amount: -1, rank_amount: -2)
 
    traversal_coordinate == destination_coordinate
  end

  def one_down_two_left?(initial_coordinate, destination_coordinate)
    traversal_coordinate = initial_coordinate.change_coordinate_by(file_amount: -2, rank_amount: -1)
 
    traversal_coordinate == destination_coordinate
  end
end
