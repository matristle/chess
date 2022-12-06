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
    queenside_placement_index, kingside_placement_index = 0, 7
    
    PieceMaker.set_of_piece_class_symbols.each do |piece_class_symbol|
      case piece_class_symbol
      when :pawn
        place_pawns_on_respective_row(color, piece_class_symbol)
      when :queen
        board.place(new_piece(piece_class_symbol, color), queenside_coordinate_at(queenside_placement_index, color))
      when :king
        board.place(new_piece(piece_class_symbol, color), kingside_coordinate_at(kingside_placement_index, color))
      else
        board.place(new_piece(piece_class_symbol, color), queenside_coordinate_at(queenside_placement_index, color))
        board.place(new_piece(piece_class_symbol, color), kingside_coordinate_at(kingside_placement_index, color))
        
        queenside_placement_index += 1; kingside_placement_index -= 1 
      end
    end
  end
  
  def place_pawns_on_respective_row(color, piece_class_symbol)
    case color
    when :white
      board.coordinates_at(rank_number: 2).each { |coordinate| board.place(new_piece(piece_class_symbol, color), coordinate) }
    when :black
      board.coordinates_at(rank_number: 7).each { |coordinate| board.place(new_piece(piece_class_symbol, color), coordinate) }
    end
  end

  def new_piece(piece_class_symbol, color)
    PieceMaker.make(piece_class_symbol, color)
  end
  
  def queenside_coordinate_at(queenside_placement_index, color)
    case color
    when :white
      board.coordinates_at(rank_number: 1)[queenside_placement_index] 
    when :black
      board.coordinates_at(rank_number: 8)[queenside_placement_index]
    end
  end
  
  def kingside_coordinate_at(kingside_placement_index, color)
    case color
    when :white
      board.coordinates_at(rank_number: 1)[kingside_placement_index] 
    when :black
      board.coordinates_at(rank_number: 8)[kingside_placement_index]
    end
  end
end
