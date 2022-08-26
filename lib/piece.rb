class Piece
  attr_reader :board, :validity_inspector

  def initialize(board:, validity_inspector:)
    @board = board
    @validity_inspector = validity_inspector
  end

  def move(destination_coordinate:)
    board.transport(destination_coordinate:) if validity_inspector.valid_move?(destination_coordinate:)
  end
end
