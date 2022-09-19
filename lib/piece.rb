class Piece
  attr_reader :board, :validator, :color

  def initialize(board:, validator:, color: :fix_me)
    @board = board
    @validator = validator
  end

  def move(destination_coordinate:)
    board.transport(destination_coordinate:) if validator.valid_move?(destination_coordinate:)
  end
end
