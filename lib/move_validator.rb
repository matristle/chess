class MoveValidator
  def valid_move?(initial_coordinate, destination_coordinate, board)
    check_for_imminent_captured_king_on(destination_coordinate, board)
    check_for_imminent_ally_piece_capturing_from(initial_coordinate, destination_coordinate, board)
    check_for_intervening_pieces_between(initial_coordinate, destination_coordinate, board)
    check_validity_based_on_piece(initial_coordinate, destination_coordinate, board)
  end

  def any_intervening_piece_between?(initial_coordinate, destination_coordinate, board)
    return false if one_step?(initial_coordinate, destination_coordinate)

    traversal_coordinates(initial_coordinate, destination_coordinate, board).any? { |traversal_coordinate| board.piece_on? traversal_coordinate }
  end

  private

  def check_validity_based_on_piece(initial_coordinate, destination_coordinate, board)
    if board.rook_on?(initial_coordinate)
      return rook_move?(initial_coordinate, destination_coordinate)
    elsif board.knight_on?(initial_coordinate)
      return knight_move?(initial_coordinate, destination_coordinate)
    elsif board.bishop_on?(initial_coordinate)
      return bishop_move?(initial_coordinate, destination_coordinate)
    elsif board.queen_on?(initial_coordinate)
      return queen_move?(initial_coordinate, destination_coordinate)
    elsif board.king_on?(initial_coordinate) 
      check_for_guarding_piece_on(destination_coordinate, board, initial_coordinate)
      return king_move?(initial_coordinate, destination_coordinate)
    end
  end

  def traversal_coordinates(initial_coordinate, destination_coordinate, board)
    if rook_move?(initial_coordinate, destination_coordinate)
      if same_rank?(initial_coordinate, destination_coordinate)
        result = board.coordinate_references_at(rank: initial_coordinate.rank)
      else
        result = board.coordinate_references_at(file: initial_coordinate.file)
      end

      discard_boundary_coordinates(result, initial_coordinate, destination_coordinate)
    elsif bishop_move?(initial_coordinate, destination_coordinate)
      result = board.diagonal_coordinates_between(initial_coordinate, destination_coordinate)
      discard_boundary_coordinates(result, initial_coordinate, destination_coordinate)
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

    found_piece_coordinate_index = leftside_file.index { |coordinate| board.piece_on? coordinate }
    found_piece_coordinate = leftside_file[found_piece_coordinate_index] if found_piece_coordinate_index

    unless found_piece_coordinate_index
      found_piece_coordinate_index = rightside_file.index { |coordinate| board.piece_on? coordinate }

      found_piece_coordinate = rightside_file[found_piece_coordinate_index] if found_piece_coordinate_index
    end

    if found_piece_coordinate && found_piece_coordinate != initial_coordinate
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


    found_piece_coordinate_index = leftside_rank.index { |coordinate| board.piece_on? coordinate }
    found_piece_coordinate = leftside_rank[found_piece_coordinate_index] if found_piece_coordinate_index

    unless found_piece_coordinate_index
      found_piece_coordinate_index = rightside_rank.index { |coordinate| board.piece_on? coordinate }

      found_piece_coordinate = rightside_rank[found_piece_coordinate_index] if found_piece_coordinate_index
    end

    if found_piece_coordinate && found_piece_coordinate != initial_coordinate
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
    
    found_piece_coordinate_index = top_right_diagonal.compact.index { |coordinate| board.piece_on? coordinate }
    found_piece_coordinate = top_right_diagonal[found_piece_coordinate_index] if found_piece_coordinate_index
    
    if found_piece_coordinate && found_piece_coordinate != initial_coordinate
      return false if board.same_piece_color_on?(initial_coordinate, found_piece_coordinate)
      
      return board.bishop_on?(found_piece_coordinate) || board.queen_on?(found_piece_coordinate) || board.king_on?(found_piece_coordinate)
    end
    
    false
  end
  
  def guarding_piece_on_top_left_diagonal?(destination_coordinate, board, initial_coordinate)
    top_left_diagonal = board.top_left_diagonal_references_from(destination_coordinate)
    
    found_piece_coordinate_index = top_left_diagonal.compact.index { |coordinate| board.piece_on? coordinate }
    found_piece_coordinate = top_left_diagonal[found_piece_coordinate_index] if found_piece_coordinate_index
    
    if found_piece_coordinate && found_piece_coordinate != initial_coordinate
      return false if board.same_piece_color_on?(initial_coordinate, found_piece_coordinate)
      
      return true if board.bishop_on?(found_piece_coordinate) || board.queen_on?(found_piece_coordinate) || board.king_on?(found_piece_coordinate)
    end
    
    false
  end
  
  def guarding_piece_on_bottom_right_diagonal?(destination_coordinate, board, initial_coordinate)
    bottom_right_diagonal = board.bottom_right_diagonal_references_from(destination_coordinate)
    
    found_piece_coordinate_index = bottom_right_diagonal.compact.index { |coordinate| board.piece_on? coordinate }
    found_piece_coordinate = bottom_right_diagonal[found_piece_coordinate_index] if found_piece_coordinate_index
    
    if found_piece_coordinate && found_piece_coordinate != initial_coordinate
      return false if board.same_piece_color_on?(initial_coordinate, found_piece_coordinate)
      
      return board.bishop_on?(found_piece_coordinate) || board.queen_on?(found_piece_coordinate) || board.king_on?(found_piece_coordinate)
    end
    
    false
  end
  
  def guarding_piece_on_bottom_left_diagonal?(destination_coordinate, board, initial_coordinate)
    bottom_left_diagonal = board.bottom_left_diagonal_references_from(destination_coordinate)
    
    found_piece_coordinate_index = bottom_left_diagonal.compact.index { |coordinate| board.piece_on? coordinate }
    found_piece_coordinate = bottom_left_diagonal[found_piece_coordinate_index] if found_piece_coordinate_index
    
    if found_piece_coordinate && found_piece_coordinate != initial_coordinate
      return false if board.same_piece_color_on?(initial_coordinate, found_piece_coordinate)
      
      return board.bishop_on?(found_piece_coordinate) || board.queen_on?(found_piece_coordinate) || board.king_on?(found_piece_coordinate)
    end
    
    false
  end
  
  def guarding_knight_on(destination_coordinate, board, initial_coordinate)
    l_shapes = board.l_shape_coordinates_from(destination_coordinate).compact
    
    found_piece_coordinate_index = l_shapes.index { |coordinate| board.piece_on? coordinate }
    
    if found_piece_coordinate_index
      found_piece_coordinate = l_shapes[found_piece_coordinate_index]
      return false if board.same_piece_color_on?(initial_coordinate, found_piece_coordinate)
      
      return board.knight_on?(found_piece_coordinate)
    end
    
    false
  end

  def discard_boundary_coordinates(traversal_coordinates, initial_coordinate, destination_coordinate)
    traversal_coordinates.reject! { |coordinate| coordinate == initial_coordinate || coordinate == destination_coordinate }
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
