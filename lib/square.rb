require_relative 'temporary_patch'

class Square
  attr_reader :piece
  using TemporaryPatch

  def initialize(color:)
    foul_input_guard_for(color)

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
    foul_input_guard(piece)

    @piece = piece
  end

  def ==(other)
    self.color == other.color && self.piece == other.piece
  end
  
  protected
  
  attr_reader :color

  private

  def set_of_chess_pieces
    %i(pawn rook bishop queen king knight)
  end

  def foul_input_guard_for(color)
    unless color == :light || color == :dark 
      raise "Foul color input. The square color must be either :dark or :light, not #{color}"
    end
  end

  def foul_input_guard(piece, extra_reminder: :pending_abstraction)
    unless piece.belongs_to? set_of_chess_pieces
      raise "The #{piece} is not in the set of domain pieces" 
    end
  end
end
