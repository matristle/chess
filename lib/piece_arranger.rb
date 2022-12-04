require_relative 'piece_maker'

class PieceArranger
  def setup_pieces_on(board)
    @board = board
    
    setup_pieces_for(:white)
    setup_pieces_for(:black)

    @board = nil
  end

  private
  
  attr_reader :piece_maker, :board

  def setup_pieces_for(color)
    queenside_index, kingside_index = 0, 7
    
    PieceMaker.set_of_piece_classes.each do |piece_class|
      case piece_class.to_s.to_sym
      when :Pawn
        place_pawns_on_respective_row(color, piece_class)
      else
        case piece_class.to_s.to_sym
        when :Queen
          board.place(new_piece(piece_class, color), queenside_coordinate_at(queenside_index, color))
        when :King
          board.place(new_piece(piece_class, color), kingside_coordinate_at(kingside_index, color))
        else
          board.place(new_piece(piece_class, color), queenside_coordinate_at(queenside_index, color))
          board.place(new_piece(piece_class, color), kingside_coordinate_at(kingside_index, color))
          
          queenside_index += 1; kingside_index -= 1 
        end
      end
    end
  end
  
  def place_pawns_on_respective_row(color, piece_class)
    case color
    when :white
      board.coordinates_at(rank_number: 2).each { |coordinate| board.place(new_piece(piece_class, color), coordinate) }
    when :black
      board.coordinates_at(rank_number: 7).each { |coordinate| board.place(new_piece(piece_class, color), coordinate) }
    end
  end
  
  def new_piece(piece_class, color)
    PieceMaker.make(piece_class, color)
  end
  
  def queenside_coordinate_at(queenside_index, color)
    case color
    when :white
      board.coordinates_at(rank_number: 1)[queenside_index] 
    when :black
      board.coordinates_at(rank_number: 8)[queenside_index]
    end
  end
  
  def kingside_coordinate_at(kingside_index, color)
    case color
    when :white
      board.coordinates_at(rank_number: 1)[kingside_index] 
    when :black
      board.coordinates_at(rank_number: 8)[kingside_index]
    end
  end
end
