class Validator
  attr_reader :board, :current_coordinate, :destination_coordinate, :selected_piece

  def initialize(board:)
    @board = board
  end

  def valid_move?
    valid_piece_move? && valid_board_move?
  end

  private

  def valid_piece_move?
    set_attributes

    case selected_piece
    when Rook
      same_file_or_rank?
    when Bishop
      same_file_rank_steps?
    when Queen
      same_file_or_rank? || same_file_rank_steps?
    end
  end

  def valid_board_move?; end

  def set_attributes
    @selected_piece = board.selected_piece
    @current_coordinate     = selected_piece.current_coordinate
    @destination_coordinate = selected_piece.destination_coordinate
  end

  def same_file_or_rank?
    current_coordinate[0] == destination_coordinate[0] || current_coordinate[1] == destination_coordinate[1]
  end

  def same_file_rank_steps?
    rank_difference == file_difference
  end

  def file_number_mapping
    { a: 1, b: 2, c: 3, d: 4, e: 5, f: 6, g: 7, h: 8 }
  end

  def rank_difference
    destination_coordinate[1].to_i - current_coordinate[1].to_i
  end

  def file_difference
    file_number_mapping[destination_coordinate[0].to_sym] - file_number_mapping[current_coordinate[0].to_sym]
  end
end
