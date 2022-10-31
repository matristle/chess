require_relative 'intrinsically_movable'

class Rook < Piece
  include IntrinsicallyMovable

  def valid_move?
    valid_piece_move? && valid_board_move?
  end

  private

  attr_reader :current_coordinate, :destination_coordinate

  def valid_piece_move?
    same_file_or_rank?
  end

  def valid_board_move?; end
end
