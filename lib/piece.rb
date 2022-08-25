class Piece
  attr_reader :board

  def initialize(board:)
    @board = board
  end

  def move(destination_coordinate:)
    board.transport(destination_coordinate)
  end
end
