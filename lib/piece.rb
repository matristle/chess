class Piece
  attr_reader :board, :validator

  def initialize(board:, validator:)
    @board = board
    @validator = validator
  end

  def move(destination_coordinate:)
    board.transport(destination_coordinate:) if validator.valid_move?(destination_coordinate:)
  end
end
