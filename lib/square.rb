require_relative 'board_maker'

class Square
  def initialize(color:)
    foul_color_input_guard(color)

    @color  = color
  end

  def light?
    color == :light
  end

  def dark?
    color == :dark
  end

  def empty?
    piece.nil?
  end
  
  def occupied?
    !empty?
  end
  
  def same_color_as?(other)
    self.color == other.color
  end

  def occupied_like?(other)
    self.occupied? && other.occupied?
  end

  def host(piece)
    foul_piece_input_guard(piece)

    @piece = piece
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
  
  protected
  
  attr_reader :color, :piece

  private

  def foul_color_input_guard(color)
    unless color == :light || color == :dark 
      raise "Foul color input. The square color must be either :dark or :light, not #{color}"
    end
  end

  def foul_piece_input_guard(piece)
    unless BoardMaker.set_of_chess_pieces.include? piece.class
      raise "The #{piece.class} is not in the set of domain pieces" 
    end
  end
end
