require_relative 'piece_maker'

class PieceArranger
  def initialize
    @piece_maker = PieceMaker.new
  end

  def self.set_of_chess_pieces
    [Pawn, Rook, Knight, Bishop, Queen, King]
  end

  def setup_pieces_on(board)
    setup_pieces_for(:white, board)
    setup_pieces_for(:black, board)
  end

  private

  def setup_pieces_for(color, board)
    left_index, right_index = 0, 7

    PieceArranger.set_of_chess_pieces.each do |piece_class|
      if piece_class == Pawn
        case color
        when :white
          board.coordinates_at(rank_number: 2).each { |coordinate| board.place(Pawn.new(color), coordinate) }
        when :black
          board.coordinates_at(rank_number: 7).each { |coordinate| board.place(Pawn.new(color), coordinate) }
        end
      else
        case color
        when :white
          current_leftside_coordinate  = board.coordinates_at(rank_number: 1)[left_index]
          current_rightside_coordinate = board.coordinates_at(rank_number: 1)[right_index]  
        when :black
          current_leftside_coordinate  = board.coordinates_at(rank_number: 8)[left_index]
          current_rightside_coordinate = board.coordinates_at(rank_number: 8)[right_index] 
        end

        if piece_class == Queen
          board.place(piece_class.new(color), current_leftside_coordinate)
        elsif piece_class == King
          board.place(piece_class.new(color), current_rightside_coordinate)
        else
          board.place(piece_class.new(color), current_leftside_coordinate)
          board.place(piece_class.new(color), current_rightside_coordinate)

          left_index += 1; right_index -= 1 
        end
      end
    end
  end
end
