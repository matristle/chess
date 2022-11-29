class King < Piece
  def self.setup_on(board, color, index)
    board.square_at(current_rightside_coordinate(board, color, index)).host(self.new(color)) 
  end

  def self.current_rightside_coordinate(board, color, index)
    case color
    when :white
      board.coordinates_at(rank_number: 1)[kingside index]
    when :black
      board.coordinates_at(rank_number: 8)[kingside index]
    end
  end
end
