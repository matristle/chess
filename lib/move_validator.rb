class MoveValidator
  def valid_move?(initial_coordinate, destination_coordinate, board)
    check_for_imminent_captured_king_on(destination_coordinate, board)
    check_for_imminent_ally_piece_capturing_from(initial_coordinate, destination_coordinate, board)
    check_for_intervening_pieces_between(initial_coordinate, destination_coordinate, board)
    validate_based_on_piece(initial_coordinate, destination_coordinate, board)
  end

  def any_intervening_piece_between?(initial_coordinate, destination_coordinate, board)
    return false if one_step?(initial_coordinate, destination_coordinate)

    traversal_coordinates(initial_coordinate, destination_coordinate, board).any? { |traversal_coordinate| board.piece_on? traversal_coordinate }
  end

  def castling_move?(board, initial_coordinate, destination_coordinate)
    short_castling?(board, initial_coordinate, destination_coordinate) || long_castling?(board)
  end

  private

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
      return true if castling_move?(board, initial_coordinate, destination_coordinate)
      king_move?(initial_coordinate, destination_coordinate)
    end
  end

  def short_castling?(board, initial_coordinate, destination_coordinate)
    e1 = Coordinate.new(:e1); f1 = Coordinate.new(:f1); g1 = Coordinate.new(:g1); h1 = Coordinate.new(:h1)
    e8 = Coordinate.new(:e8); f8 = Coordinate.new(:f8); g8 = Coordinate.new(:g8); h8 = Coordinate.new(:h8)

    return false unless (initial_coordinate == e1 && destination_coordinate == g1) || (initial_coordinate == e8 && destination_coordinate == g8)

    raise "The king can't castle because it has moved before" if board.piece_on?(e1) && board.piece_has_moved_before_on?(e1)
    raise "The king can't castle because the rook has moved before" if board.piece_on?(h1) && board.piece_has_moved_before_on?(h1)

    if board.white_piece_on?(e1) && board.white_piece_on?(h1)
      raise "The king can't castle through a guarded square" if guarding_piece_on?(f1, board, e1)
      
      board.king_on?(e1) && board.rook_on?(h1)
    elsif board.black_piece_on?(e8) && board.black_piece_on?(h8)
      raise "The king can't castle through a guarded square" if guarding_piece_on?(f8, board, e8)

      board.king_on?(e8) && board.rook_on?(h8)
    end
  end

  def long_castling?(board)
    if board.white_piece_on?(Coordinate.new(:e1)) && board.white_piece_on?(Coordinate.new(:a1))
      raise "The king can't castle through a guarded square" if guarding_piece_on?(Coordinate.new(:d1), board, Coordinate.new(:e1))
      
      board.king_on?(Coordinate.new(:e1)) && board.rook_on?(Coordinate.new(:a1)) 
    elsif board.black_piece_on?(Coordinate.new(:e8)) && board.black_piece_on?(Coordinate.new(:a8))
      raise "The king can't castle through a guarded square" if guarding_piece_on?(Coordinate.new(:d8), board, Coordinate.new(:e8))

      board.king_on?(Coordinate.new(:e8)) && board.rook_on?(Coordinate.new(:a8))
    end
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

  def check_for_imminent_captured_king_on(destination_coordinate, board)
    raise "The king can't be captured/replaced" if board.king_on? destination_coordinate
  end

  def check_for_imminent_ally_piece_capturing_from(initial_coordinate, destination_coordinate, board)
    raise "The piece on #{destination_coordinate.symbol} is an ally, so the piece at #{initial_coordinate.symbol} can't replace it" if board.same_piece_color_on?(initial_coordinate, destination_coordinate)
  end

  def check_for_intervening_pieces_between(initial_coordinate, destination_coordinate, board)
    raise "The move is invalid since there's an intervening piece between #{initial_coordinate.symbol} and #{destination_coordinate.symbol}" if any_intervening_piece_between?(initial_coordinate, destination_coordinate, board)
  end

  def check_for_guarding_piece_on(destination_coordinate, board, initial_coordinate)
    raise "The king can't move into an opponent's piece moveset" if guarding_piece_on?(destination_coordinate, board, initial_coordinate)
  end

  def guarding_piece_on?(destination_coordinate, board, initial_coordinate)
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

    found_piece_coordinate = leftside_file.find  { |coordinate| board.piece_on? coordinate }
    found_piece_coordinate = rightside_file.find { |coordinate| board.piece_on? coordinate } unless found_piece_coordinate

    if found_piece_coordinate
      return false if board.same_piece_color_on?(initial_coordinate, found_piece_coordinate)

      return board.rook_on?(found_piece_coordinate) || board.queen_on?(found_piece_coordinate) || board.king_on?(found_piece_coordinate) 
    end

    false
  end

  def guarding_piece_on_rank?(destination_coordinate, board, initial_coordinate)
    destination_rank = board.coordinate_references_at(rank: destination_coordinate.rank)
    split_point_index = destination_coordinate.rank.to_i - 1
    leftside_rank, rightside_rank = destination_rank[0...split_point_index], destination_rank[split_point_index+1..-1]
    leftside_rank.delete(initial_coordinate)
    rightside_rank.delete(initial_coordinate)

    found_piece_coordinate = leftside_rank.find  { |coordinate| board.piece_on? coordinate }
    found_piece_coordinate = rightside_rank.find { |coordinate| board.piece_on? coordinate } unless found_piece_coordinate

    if found_piece_coordinate
      return false if board.same_piece_color_on?(initial_coordinate, found_piece_coordinate)
      
      return board.rook_on?(found_piece_coordinate) || board.queen_on?(found_piece_coordinate) || board.king_on?(found_piece_coordinate)
    end
    
    false
  end
  
  def guarding_piece_on_diagonals?(destination_coordinate, board, initial_coordinate)
    guarding_piece_on_top_right_diagonal?(destination_coordinate, board, initial_coordinate)    || guarding_piece_on_top_left_diagonal?(destination_coordinate, board, initial_coordinate) ||
    guarding_piece_on_bottom_right_diagonal?(destination_coordinate, board, initial_coordinate) || guarding_piece_on_bottom_left_diagonal?(destination_coordinate, board, initial_coordinate)
  end
  
  def guarding_piece_on_top_right_diagonal?(destination_coordinate, board, initial_coordinate)
    top_right_diagonal = board.top_right_diagonal_references_from(destination_coordinate)
    
    found_piece_coordinate = top_right_diagonal.find { |coordinate| board.piece_on? coordinate }

    if found_piece_coordinate
      return false if board.same_piece_color_on?(initial_coordinate, found_piece_coordinate)
      
      return board.bishop_on?(found_piece_coordinate) || board.queen_on?(found_piece_coordinate) || board.king_on?(found_piece_coordinate)
    end
    
    false
  end
  
  def guarding_piece_on_top_left_diagonal?(destination_coordinate, board, initial_coordinate)
    top_left_diagonal = board.top_left_diagonal_references_from(destination_coordinate)
    
    found_piece_coordinate = top_left_diagonal.find { |coordinate| board.piece_on? coordinate }

    if found_piece_coordinate
      return false if board.same_piece_color_on?(initial_coordinate, found_piece_coordinate)
      
      return true if board.bishop_on?(found_piece_coordinate) || board.queen_on?(found_piece_coordinate) || board.king_on?(found_piece_coordinate)
    end
    
    false
  end
  
  def guarding_piece_on_bottom_right_diagonal?(destination_coordinate, board, initial_coordinate)
    bottom_right_diagonal = board.bottom_right_diagonal_references_from(destination_coordinate)
    
    found_piece_coordinate = bottom_right_diagonal.find { |coordinate| board.piece_on? coordinate }

    if found_piece_coordinate
      return false if board.same_piece_color_on?(initial_coordinate, found_piece_coordinate)
      
      return board.bishop_on?(found_piece_coordinate) || board.queen_on?(found_piece_coordinate) || board.king_on?(found_piece_coordinate)
    end
    
    false
  end
  
  def guarding_piece_on_bottom_left_diagonal?(destination_coordinate, board, initial_coordinate)
    bottom_left_diagonal = board.bottom_left_diagonal_references_from(destination_coordinate)
    
    found_piece_coordinate = bottom_left_diagonal.find { |coordinate| board.piece_on? coordinate }

    if found_piece_coordinate
      return false if board.same_piece_color_on?(initial_coordinate, found_piece_coordinate)
      
      return board.bishop_on?(found_piece_coordinate) || board.queen_on?(found_piece_coordinate) || board.king_on?(found_piece_coordinate)
    end
    
    false
  end
  
  def guarding_knight_on(destination_coordinate, board, initial_coordinate)
    l_shapes = board.l_shape_coordinates_from(destination_coordinate).compact
    
    found_piece_coordinate = l_shapes.find { |coordinate| board.piece_on? coordinate }
    
    if found_piece_coordinate
      return false if board.same_piece_color_on?(initial_coordinate, found_piece_coordinate)
      
      return board.knight_on?(found_piece_coordinate)
    end
    
    false
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
