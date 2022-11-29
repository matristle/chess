class Queen < Piece
  def self.setup_on(board, color, index)
    board.place(self.new(color), current_leftside_coordinate(board, color, index)) 
  end

  def self.current_leftside_coordinate(board, color, index)
    case color
    when :white
      board.coordinates_at(rank_number: 1)[leftside index]
    when :black
      board.coordinates_at(rank_number: 8)[leftside index]
    end
  end
end
