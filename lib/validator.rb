require_relative 'intrinsically_movable'

class Validator
  include IntrinsicallyMovable
  attr_reader :board, :piece_color, :current_coordinate, :destination_coordinate, :selected_piece

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
    validate(selected_piece:)
  end

  def set_piece_related_attributes
    @selected_piece = board.selected_piece
    @piece_color            = selected_piece.color if selected_piece.is_a?(Pawn)
    @current_coordinate     = selected_piece.current_coordinate
    @destination_coordinate = selected_piece.destination_coordinate
  end

  def validate(selected_piece:)
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
      l_shape?
    when Pawn
      same_file? && (one_step? || two_steps?) && forward_step?(piece_color)
    end
  end
end
