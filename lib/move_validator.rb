class MoveValidator
  def valid_move?(initial_coordinate, destination_coordinate, board)
    if board.same_piece_color_on?(initial_coordinate, destination_coordinate) || board.king_on?(destination_coordinate)
      raise "The piece on #{destination_coordinate.symbol} is an ally, so the piece at #{initial_coordinate.symbol} can't replace it"
    end

    if any_intervening_piece_between?(initial_coordinate, destination_coordinate, board)
      raise "The move is invalid since there's an intervening piece between #{initial_coordinate.symbol} and #{destination_coordinate.symbol}"
    end

    if board.king_on?(initial_coordinate)
      if guarding_piece_on?(destination_coordinate, board)
        raise "The king can't move into an opponent's piece moveset"
      end   
    end

    if board.rook_on? initial_coordinate
      return false unless rook_move?(initial_coordinate, destination_coordinate)
      
      true
    elsif board.knight_on? initial_coordinate
      return false unless knight_move?(initial_coordinate, destination_coordinate)
      
      true
    elsif board.bishop_on? initial_coordinate
      return false unless bishop_move?(initial_coordinate, destination_coordinate)
      
      true
    elsif board.queen_on? initial_coordinate
      return false unless queen_move?(initial_coordinate, destination_coordinate)
      
      true
    elsif board.king_on? initial_coordinate 
      return false unless king_move?(initial_coordinate, destination_coordinate)
      
      true
    end
  end

  def any_intervening_piece_between?(initial_coordinate, destination_coordinate, board)
    if rook_move?(initial_coordinate, destination_coordinate)
      traversal_coordinates = []

      if same_rank?(initial_coordinate, destination_coordinate)
        traversal_coordinates = board.coordinate_references_at(rank: initial_coordinate.rank)
      else
        traversal_coordinates = board.coordinate_references_at(file: initial_coordinate.file)
      end

      discard_boundary_coordinates(traversal_coordinates, initial_coordinate, destination_coordinate)
      
      traversal_coordinates.each { |traversal_coordinate| return true if board.piece_on? traversal_coordinate }
    elsif bishop_move?(initial_coordinate, destination_coordinate)
      traversal_coordinates = board.diagonal_coordinates_between(initial_coordinate, destination_coordinate)
      discard_boundary_coordinates(traversal_coordinates, initial_coordinate, destination_coordinate)

      traversal_coordinates.each { |traversal_coordinate| return true if board.piece_on? traversal_coordinate }
    end

    false
  end

  private

  def guarding_piece_on?(destination_coordinate, board)
    guarding_piece_on_file_or_rank?(destination_coordinate, board) || guarding_piece_on_diagonals?(destination_coordinate, board)
  end
  
  def guarding_piece_on_file_or_rank?(destination_coordinate, board)
    guarding_piece_on_file?(destination_coordinate, board) || guarding_piece_on_rank?(destination_coordinate, board)
  end

  def guarding_piece_on_file?(destination_coordinate, board)
    destination_file = board.coordinate_references_at(file: destination_coordinate.file)
    split_point_index = destination_file.index(destination_coordinate)
    leftside_file, rightside_file = destination_file[0...split_point_index], destination_file[split_point_index+1..-1]

    found_piece_coordinate_index = leftside_file.index { |coordinate| board.piece_on? coordinate }
    found_piece_coordinate = leftside_file[found_piece_coordinate_index] if found_piece_coordinate_index

    unless found_piece_coordinate_index
      found_piece_coordinate_index = rightside_file.index { |coordinate| board.piece_on? coordinate }

      found_piece_coordinate = rightside_file[found_piece_coordinate_index] if found_piece_coordinate_index
    end

    if found_piece_coordinate_index 
      return board.rook_on?(found_piece_coordinate) || board.queen_on?(found_piece_coordinate)
    end

    false
  end

  def guarding_piece_on_rank?(destination_coordinate, board)
    destination_rank = board.coordinate_references_at(rank: destination_coordinate.rank)
    leftside_rank = destination_rank[0...destination_coordinate.rank.to_i]
    rightside_rank  = destination_rank[destination_coordinate.rank.to_i+1..-1]

    found_piece_coordinate_index = leftside_rank.index { |coordinate| board.piece_on? coordinate }
    found_piece_coordinate = leftside_rank[found_piece_coordinate_index] if found_piece_coordinate_index

    unless found_piece_coordinate_index
      found_piece_coordinate_index = rightside_rank.index { |coordinate| board.piece_on? coordinate }

      found_piece_coordinate = rightside_rank[found_piece_coordinate_index] if found_piece_coordinate_index
    end

    if found_piece_coordinate_index 
      return true if board.rook_on?(found_piece_coordinate) || board.queen_on?(found_piece_coordinate)
    end

    false
  end

  def guarding_piece_on_diagonals?(destination_coordinate, board)
    guarding_piece_on_top_right_diagonal?(destination_coordinate, board)    || guarding_piece_on_top_left_diagonal?(destination_coordinate, board) ||
    guarding_piece_on_bottom_right_diagonal?(destination_coordinate, board) || guarding_piece_on_bottom_left_diagonal?(destination_coordinate, board)
  end

  def guarding_piece_on_top_right_diagonal?(destination_coordinate, board)
    top_right_diagonal = board.top_right_diagonal_references_from(destination_coordinate)

    found_piece_coordinate_index = top_right_diagonal.compact.index { |coordinate| board.piece_on? coordinate }
    found_piece_coordinate = top_right_diagonal[found_piece_coordinate_index] if found_piece_coordinate_index

    if found_piece_coordinate_index 
      return true if board.bishop_on?(found_piece_coordinate) || board.queen_on?(found_piece_coordinate)
    end

    false
  end

  def guarding_piece_on_top_left_diagonal?(destination_coordinate, board)
    top_left_diagonal = board.top_left_diagonal_references_from(destination_coordinate)

    found_piece_coordinate_index = top_left_diagonal.compact.index { |coordinate| board.piece_on? coordinate }
    found_piece_coordinate = top_left_diagonal[found_piece_coordinate_index] if found_piece_coordinate_index

    if found_piece_coordinate_index 
      return true if board.bishop_on?(found_piece_coordinate) || board.queen_on?(found_piece_coordinate)
    end

    false
  end

  def guarding_piece_on_bottom_right_diagonal?(destination_coordinate, board)
    bottom_right_diagonal = board.bottom_right_diagonal_references_from(destination_coordinate)

    found_piece_coordinate_index = bottom_right_diagonal.compact.index { |coordinate| board.piece_on? coordinate }
    found_piece_coordinate = bottom_right_diagonal[found_piece_coordinate_index] if found_piece_coordinate_index

    if found_piece_coordinate_index 
      return true if board.bishop_on?(found_piece_coordinate) || board.queen_on?(found_piece_coordinate)
    end

    false
  end

  def guarding_piece_on_bottom_left_diagonal?(destination_coordinate, board)
    bottom_left_diagonal = board.bottom_left_diagonal_references_from(destination_coordinate)

    found_piece_coordinate_index = bottom_left_diagonal.compact.index { |coordinate| board.piece_on? coordinate }
    found_piece_coordinate = bottom_left_diagonal[found_piece_coordinate_index] if found_piece_coordinate_index

    if found_piece_coordinate_index 
      return true if board.bishop_on?(found_piece_coordinate) || board.queen_on?(found_piece_coordinate)
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
