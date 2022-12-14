require_relative 'piece_maker'

class Square
  def initialize(color:)
    foul_color_input_guard(color)

    @color  = color
    @status = :empty
  end

  def light?
    color == :light
  end

  def dark?
    color == :dark
  end

  def empty?
    status == :empty
  end
  
  def occupied?
    status == :occupied
  end
  
  def same_color_as?(other)
    self.color == other.color
  end

  def occupied_like?(other)
    self.occupied? && other.occupied?
  end

  def host(piece)
    foul_piece_input_guard(piece)

    @piece  = piece
    @status = :occupied
  end

  def ==(other)
    self.color == other.color && self.piece == other.piece
  end
  
  def white_piece_here?
    piece.white?
  end

  def black_piece_here?
    piece.black?
  end

  def pawn_here?
    piece.is_a? Pawn
  end

  def rook_here?
    piece.is_a? Rook
  end

  def knight_here?
    piece.is_a? Knight
  end

  def bishop_here?
    piece.is_a? Bishop
  end

  def queen_here?
    piece.is_a? Queen
  end
  
  def king_here?
    piece.is_a? King
  end

  def move_piece_to(destination_coordinate, board)
    board.place(piece, destination_coordinate)
    kick_out_piece
  end
  
  def has_piece_with_diff_color_than?(other)
    !has_piece_with_same_color_as? other
  end

  def has_piece_with_same_color_as?(other)
    self.piece.same_color_as? other.piece
  end
  
  protected
  
  attr_reader :color, :piece, :status

  private

  def kick_out_piece
    @piece  = nil
    @status = :empty 
  end

  def foul_color_input_guard(color)
    unless %i[light dark].include? color
      raise "Foul color input. The square color must be either :dark or :light, not #{color}"
    end
  end

  def foul_piece_input_guard(piece)
    unless PieceMaker.piece_classes.include? piece.class
      raise "The #{piece.class} is not in the set of domain pieces" 
    end
  end
end
