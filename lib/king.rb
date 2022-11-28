class King < Piece
  def self.setup_on(board, color)
    case color
    when :white
      current_rightside_coordinate  = board.coordinates_at(rank_number: 1)[4]
    when :black
      current_rightside_coordinate  = board.coordinates_at(rank_number: 8)[4]
    end

    board.square_at(current_rightside_coordinate).host(self.new(color)) 
  end
end
