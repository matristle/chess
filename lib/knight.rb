require_relative 'piece'
require_relative 'intrinsically_movable'

class Knight < Piece
  include IntrinsicallyMovable

  def valid_move?
    return false if same_coordinate?

    valid_piece_move? && valid_board_move?
  end

  private

  attr_reader :current_coordinate, :destination_coordinate

  def valid_piece_move?
    l_shape?
  end

  def valid_board_move?
    return true  unless board.piece_at?(destination_coordinate.to_sym)
    return false if king_at?(destination_coordinate)
    return true  unless ally_piece_at?(destination_coordinate)
    return false if ally_piece_at?(destination_coordinate)

    raise 'Not implemented yet OR not anticipated'
  end
end
