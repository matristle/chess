class Validator
  attr_reader :board, :current_coordinate, :destination_coordinate, :selected_piece

  def initialize(board:)
    @board = board
  end

  def valid_move?
    valid_piece_move? && valid_board_move?
  end

  private

  def valid_board_move?; end

  def valid_piece_move?
    set_piece_related_attributes
    choose_piece_behavior(selected_piece:)
  end

  def set_piece_related_attributes
    @selected_piece = board.selected_piece
    @current_coordinate     = selected_piece.current_coordinate
    @destination_coordinate = selected_piece.destination_coordinate
  end

  def choose_piece_behavior(selected_piece:)
    case selected_piece
    when Rook
      same_file_or_rank?
    when Bishop
      same_file_rank_steps?
    when Queen
      same_file_or_rank? || same_file_rank_steps?
    when King
      (same_file_or_rank? || same_file_rank_steps?) && one_step?
    when Knight
      l_shape_step?
    when Pawn
      (same_file? && one_step?) || (same_file? && two_steps?)
    end
  end

  def same_file_or_rank?
    same_file? || same_rank?
  end

  def same_file? 
    current_coordinate.file == destination_coordinate.file
  end

  def same_rank? 
    current_coordinate.rank == destination_coordinate.rank
  end

  def same_file_rank_steps?
    rank_difference == file_difference
  end

  def rank_difference
    (destination_coordinate.rank.to_i - current_coordinate.rank.to_i).abs
  end

  def file_difference
    (file_number_mapping[destination_coordinate.file.to_sym] - file_number_mapping[current_coordinate.file.to_sym]).abs
  end

  def file_number_mapping
    { a: 1, b: 2, c: 3, d: 4, e: 5, f: 6, g: 7, h: 8 }
  end

  def one_step?
    rank_difference == 1 || file_difference == 1
  end

  def l_shape_step?
    (rank_difference == 1 && file_difference == 2) || (rank_difference == 2 && file_difference == 1)
  end

  def two_steps?
    rank_difference == 2 || file_difference == 2
  end
end
