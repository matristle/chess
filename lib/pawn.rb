require_relative 'piece'

class Pawn < Piece
  def self.setup_on(board, color, index)
    case color
    when :white
      board.coordinates_at(rank_number: 2).each { |coordinate| board.place(self.new(color), coordinate) }
    when :black
      board.coordinates_at(rank_number: 7).each { |coordinate| board.place(self.new(color), coordinate) }
    end
  end
end
 
