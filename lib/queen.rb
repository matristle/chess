class Queen < Piece
  def self.setup_on(board, color)
    case color
    when :white
      current_leftside_coordinate  = board.coordinates_at(rank_number: 1)[3]
    when :black
      current_leftside_coordinate  = board.coordinates_at(rank_number: 8)[3]
    end

    board.square_at(current_leftside_coordinate).host(self.new(color)) 
  end
end
