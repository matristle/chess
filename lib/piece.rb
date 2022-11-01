class Piece
  attr_reader :board, :validator, :color

  def initialize(board:, validator: :fix_me, color: :fix_me)
    @board = board
    @validator = validator
    @color = color
  end

  def move(destination_coordinate:)
    board.transport(destination_coordinate:) if validator.valid_move?(destination_coordinate:)
  end

  def ally_piece_at?(coordinate)
    raise 'You need to fix the :fix_me stub' if color == :fix_me

    same_color?(coordinate)
  end

  def king_at?(coordinate)
    board[coordinate.symbol].is_a?(King)
  end

  private

  attr_reader :board, :validator, :color

  def same_color?(coordinate)
    other_piece = board[coordinate.symbol]
    self.color == other_piece.color
  end
end
