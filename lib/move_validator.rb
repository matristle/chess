class MoveValidator
  def valid_move?(current_coordinate, destination_coordinate, board)
    if board.rook_on? current_coordinate
      return false unless rook_move?(current_coordinate, destination_coordinate)
      
      true
    elsif board.knight_on? current_coordinate
      return false unless knight_move?(current_coordinate, destination_coordinate)
      
      true
    elsif board.bishop_on? current_coordinate
      return false unless bishop_move?(current_coordinate, destination_coordinate)
      
      true
    elsif board.queen_on? current_coordinate
      return false unless queen_move?(current_coordinate, destination_coordinate)
      
      true
    elsif board.king_on? current_coordinate 
      return false unless king_move?(current_coordinate, destination_coordinate)
      
      true
    end
  end

  private

  def king_move?(current_coordinate, destination_coordinate)
    queen_move?(current_coordinate, destination_coordinate) && one_step?(current_coordinate, destination_coordinate)
  end

  def one_step?(current_coordinate, destination_coordinate)
    current_coordinate_file_number     = Coordinate.file_to_number(current_coordinate.file)
    destination_coordinate_file_number = Coordinate.file_to_number(destination_coordinate.file)

    (destination_coordinate_file_number.to_i - current_coordinate_file_number.to_i).abs == 1 || (destination_coordinate.rank.to_i - current_coordinate.rank.to_i).abs == 1
  end

  def queen_move?(current_coordinate, destination_coordinate)
    rook_move?(current_coordinate, destination_coordinate) || bishop_move?(current_coordinate, destination_coordinate)
  end

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

  def bishop_move?(current_coordinate, destination_coordinate)
    diagonal_move?(current_coordinate, destination_coordinate)
  end

  def diagonal_move?(current_coordinate, destination_coordinate)
    same_file_and_rank?(current_coordinate, destination_coordinate)
  end

  def same_file_and_rank?(current_coordinate, destination_coordinate)
    current_coordinate_file_number     = Coordinate.file_to_number(current_coordinate.file)
    destination_coordinate_file_number = Coordinate.file_to_number(destination_coordinate.file)


    (destination_coordinate_file_number.to_i - current_coordinate_file_number.to_i).abs == (destination_coordinate.rank.to_i - current_coordinate.rank.to_i).abs
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
end
