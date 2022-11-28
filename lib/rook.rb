class Rook < Piece
  def self.setup_on(board, color)
    case color
    when :white
      current_leftside_coordinate  = board.coordinates_at(rank_number: 1)[0]
      current_rightside_coordinate = board.coordinates_at(rank_number: 1)[7]      
    when :black
      current_leftside_coordinate  = board.coordinates_at(rank_number: 8)[0]
      current_rightside_coordinate = board.coordinates_at(rank_number: 8)[7] 
    end

    board.square_at(current_leftside_coordinate).host(self.new(color)) 
    board.square_at(current_rightside_coordinate).host(self.new(color))
  end
end
