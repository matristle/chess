require_relative 'piece'
require_relative 'intrinsically_movable'

class King < Piece
  include IntrinsicallyMovable

  def valid_move?
    return false if same_coordinate?

    valid_piece_move? && valid_board_move?
  end

  private

  attr_reader :current_coordinate, :destination_coordinate

  def valid_piece_move?
    (same_file_or_rank? || same_file_rank_steps?) && one_step?
  end

  def valid_board_move?
    return false if moving_next_to_king?
    return true  unless board.piece_at?(destination_coordinate.to_sym)
    return false if king_at?(destination_coordinate)
    return true  unless ally_piece_at?(destination_coordinate)
    return false if ally_piece_at?(destination_coordinate)

    raise 'Not implemented yet OR not anticipated'
  end

  def moving_next_to_king?
    return false unless other_king_around?
    return true  if     other_king_around?

    raise 'Not implemented yet OR not anticipated'
  end

  def other_king_around?
    queue = []

    queue << board[destination_coordinate.slide_rank_by(1)]                                     unless same_color?(destination_coordinate.slide_rank_by(1))
    queue << board[destination_coordinate.slide_rank_by(-1)]                                    unless same_color?(destination_coordinate.slide_rank_by(-1))
    queue << board[destination_coordinate.slide_file_by(1)]                                     unless same_color?(destination_coordinate.slide_file_by(1))
    queue << board[destination_coordinate.slide_file_by(-1)]                                    unless same_color?(destination_coordinate.slide_file_by(-1))
    queue << board[destination_coordinate.slide_file_and_rank(file_amount: 1, rank_amount: -1)] unless same_color?(destination_coordinate.slide_file_and_rank(file_amount: 1, rank_amount: -1))
    queue << board[destination_coordinate.slide_file_and_rank(file_amount: -1, rank_amount: -1)] unless same_color?(destination_coordinate.slide_file_and_rank(file_amount: -1, rank_amount: -1))
    queue << board[destination_coordinate.slide_file_and_rank(file_amount: 1, rank_amount: 1)] unless same_color?(destination_coordinate.slide_file_and_rank(file_amount: 1, rank_amount: 1))
    queue << board[destination_coordinate.slide_file_and_rank(file_amount: -1, rank_amount: 1)] unless same_color?(destination_coordinate.slide_file_and_rank(file_amount: -1, rank_amount: 1))

    until queue.empty?
      suspect = queue.shift
      return true if suspect.is_a?(King)
    end

    raise 'Not implemented yet OR not anticipated'
  end
end
