require_relative 'piece_maker'

class PieceArranger
  def setup_pieces_on(board)
    @board = board
    @piece_maker = PieceMaker.new

    setup_white_pieces
    setup_black_pieces
  end

  private
  
  attr_reader :piece_maker, :board

  def setup_white_pieces
    queenside_placement_index, kingside_placement_index = 0, 7
    
    piece_maker.set_of_piece_class_symbols.each do |piece_class_symbol|
      case piece_class_symbol
      when :pawn
        place_white_pawns_on_second_rank
      when :queen
        board.place(new_piece(piece_class_symbol, :white), queenside_coordinate_on_first_rank(queenside_placement_index))
      when :king
        board.place(new_piece(piece_class_symbol, :white), kingside_coordinate_on_first_rank(kingside_placement_index))
      else
        board.place(new_piece(piece_class_symbol, :white), queenside_coordinate_on_first_rank(queenside_placement_index))
        board.place(new_piece(piece_class_symbol, :white), kingside_coordinate_on_first_rank(kingside_placement_index))
        
        queenside_placement_index += 1; kingside_placement_index -= 1 
      end
    end
  end

  def setup_black_pieces
    queenside_placement_index, kingside_placement_index = 0, 7
    
    piece_maker.set_of_piece_class_symbols.each do |piece_class_symbol|
      case piece_class_symbol
      when :pawn
        place_black_pawns_on_seventh_rank
      when :queen
        board.place(new_piece(piece_class_symbol, :black), queenside_coordinate_on_eighth_rank(queenside_placement_index))
      when :king
        board.place(new_piece(piece_class_symbol, :black), kingside_coordinate_on_eighth_rank(kingside_placement_index))
      else
        board.place(new_piece(piece_class_symbol, :black), queenside_coordinate_on_eighth_rank(queenside_placement_index))
        board.place(new_piece(piece_class_symbol, :black), kingside_coordinate_on_eighth_rank(kingside_placement_index))
        
        queenside_placement_index += 1; kingside_placement_index -= 1 
      end
    end
  end

  def place_white_pawns_on_second_rank
    board.coordinates_at(rank_number: 2).each { |coordinate| board.place(new_white_pawn, coordinate) }
  end

  def place_black_pawns_on_seventh_rank
    board.coordinates_at(rank_number: 7).each { |coordinate| board.place(new_black_pawn, coordinate) }
  end

  def new_white_pawn
    piece_maker.make(:pawn, :white)
  end

  def new_black_pawn
    piece_maker.make(:pawn, :black)
  end

  def new_piece(piece_class_symbol, color)
    piece_maker.make(piece_class_symbol, color)
  end
  
  def queenside_coordinate_on_first_rank(queenside_placement_index)
    board.coordinates_at(rank_number: 1)[queenside_placement_index] 
  end

  def queenside_coordinate_on_eighth_rank(queenside_placement_index)
    board.coordinates_at(rank_number: 8)[queenside_placement_index]
  end

  def kingside_coordinate_on_first_rank(kingside_placement_index)
    board.coordinates_at(rank_number: 1)[kingside_placement_index] 
  end

  def kingside_coordinate_on_eighth_rank(kingside_placement_index)
    board.coordinates_at(rank_number: 8)[kingside_placement_index]
  end
end
