class MoveValidator
  def valid_move?(initial_coordinate, destination_coordinate, board)
    if board.same_piece_color_on?(initial_coordinate, destination_coordinate) || board.king_on?(destination_coordinate)
      raise "The piece on #{destination_coordinate.symbol} is an ally, so the piece at #{initial_coordinate.symbol} can't replace it"
    end

    if any_intervening_piece_between?(initial_coordinate, destination_coordinate, board)
      raise "The move is invalid since there's an intervening piece between #{initial_coordinate.symbol} and #{destination_coordinate.symbol}"
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

  def discard_boundary_coordinates(traversal_coordinates, initial_coordinate, destination_coordinate)
    traversal_coordinates.reject! { |coordinate| coordinate == initial_coordinate || coordinate == destination_coordinate }
  end

  def king_move?(initial_coordinate, destination_coordinate)
    queen_move?(initial_coordinate, destination_coordinate) && one_step?(initial_coordinate, destination_coordinate)
  end

  def one_step?(initial_coordinate, destination_coordinate)
    initial_coordinate_file_number     = Coordinate.file_to_number(initial_coordinate.file)
    destination_coordinate_file_number = Coordinate.file_to_number(destination_coordinate.file)

    (destination_coordinate_file_number.to_i - initial_coordinate_file_number.to_i).abs == 1 || (destination_coordinate.rank.to_i - initial_coordinate.rank.to_i).abs == 1
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
    initial_coordinate_file_number     = Coordinate.file_to_number(initial_coordinate.file)
    destination_coordinate_file_number = Coordinate.file_to_number(destination_coordinate.file)


    (destination_coordinate_file_number.to_i - initial_coordinate_file_number.to_i).abs == (destination_coordinate.rank.to_i - initial_coordinate.rank.to_i).abs
  end

  def two_up_one_right?(initial_coordinate, destination_coordinate)
    traversal_rank = (initial_coordinate.rank.to_i + 2).to_s
    traversal_file_number = (Coordinate.file_to_number(initial_coordinate.file).to_i + 1).to_s
    traversal_file = Coordinate.number_to_file(traversal_file_number).to_s
    traversal_symbol = (traversal_file + traversal_rank).to_sym

    traversal_symbol == destination_coordinate.symbol
  end
  
  def one_up_two_right?(initial_coordinate, destination_coordinate)
    traversal_rank = (initial_coordinate.rank.to_i + 1).to_s
    traversal_file_number = (Coordinate.file_to_number(initial_coordinate.file).to_i + 2).to_s
    traversal_file = Coordinate.number_to_file(traversal_file_number).to_s
    traversal_symbol = (traversal_file + traversal_rank).to_sym

    traversal_symbol == destination_coordinate.symbol
  end

  def two_up_one_left?(initial_coordinate, destination_coordinate)
    traversal_rank = (initial_coordinate.rank.to_i + 2).to_s
    traversal_file_number = (Coordinate.file_to_number(initial_coordinate.file).to_i - 1).to_s
    traversal_file = Coordinate.number_to_file(traversal_file_number).to_s
    traversal_symbol = (traversal_file + traversal_rank).to_sym

    traversal_symbol == destination_coordinate.symbol
  end

  def one_up_two_left?(initial_coordinate, destination_coordinate)
    traversal_rank = (initial_coordinate.rank.to_i + 1).to_s
    traversal_file_number = (Coordinate.file_to_number(initial_coordinate.file).to_i - 2).to_s
    traversal_file = Coordinate.number_to_file(traversal_file_number).to_s
    traversal_symbol = (traversal_file + traversal_rank).to_sym

    traversal_symbol == destination_coordinate.symbol
  end

  def two_down_one_right?(initial_coordinate, destination_coordinate)
    traversal_rank = (initial_coordinate.rank.to_i - 2).to_s
    traversal_file_number = (Coordinate.file_to_number(initial_coordinate.file).to_i + 1).to_s
    traversal_file = Coordinate.number_to_file(traversal_file_number).to_s
    traversal_symbol = (traversal_file + traversal_rank).to_sym

    traversal_symbol == destination_coordinate.symbol
  end

  def one_down_two_right?(initial_coordinate, destination_coordinate)
    traversal_rank = (initial_coordinate.rank.to_i - 1).to_s
    traversal_file_number = (Coordinate.file_to_number(initial_coordinate.file).to_i + 2).to_s
    traversal_file = Coordinate.number_to_file(traversal_file_number).to_s
    traversal_symbol = (traversal_file + traversal_rank).to_sym

    traversal_symbol == destination_coordinate.symbol
  end

  def two_down_one_left?(initial_coordinate, destination_coordinate)
    traversal_rank = (initial_coordinate.rank.to_i - 2).to_s
    traversal_file_number = (Coordinate.file_to_number(initial_coordinate.file).to_i - 1).to_s
    traversal_file = Coordinate.number_to_file(traversal_file_number).to_s
    traversal_symbol = (traversal_file + traversal_rank).to_sym

    traversal_symbol == destination_coordinate.symbol
  end

  def one_down_two_left?(initial_coordinate, destination_coordinate)
    traversal_rank = (initial_coordinate.rank.to_i - 1).to_s
    traversal_file_number = (Coordinate.file_to_number(initial_coordinate.file).to_i - 2).to_s
    traversal_file = Coordinate.number_to_file(traversal_file_number).to_s
    traversal_symbol = (traversal_file + traversal_rank).to_sym

    traversal_symbol == destination_coordinate.symbol
  end
end
