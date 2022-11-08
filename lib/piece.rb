class Piece
  attr_reader :board, :color

  def initialize(board:, color: :fix_me)
    @board = board
    @color = color
  end

  def move(destination_coordinate:)
    board.transport(destination_coordinate:) if valid_move?(destination_coordinate:)
  end

  def ally_piece_at?(coordinate)
    raise 'You need to fix the :fix_me stub' if color == :fix_me

    same_color?(coordinate)
  end

  def king_at?(coordinate)
    board[coordinate.to_sym].piece.is_a?(King)
  end

  def same_coordinate?
    current_coordinate == destination_coordinate
  end

  def same_color?(coordinate)
    return false unless board.piece_at?(coordinate)

    other_piece_color = board[coordinate.to_sym].piece_color
    color == other_piece_color
  end
end
