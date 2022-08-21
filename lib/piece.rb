class Piece
  attr_reader :board

  def initialize(board:)
    @board = board
  end

  def move_to(destination_coordinate)
    board.transport_to(destination_coordinate)
  end
end
