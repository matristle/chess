require_relative 'board_maker'
require_relative 'temporary_patch'

class Square
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

  def occupant_is_a?(target_piece)
    case target_piece
    when :pawn
      piece == :pawn
    when :rook
      piece == :rook
    when :bishop
      piece == :bishop
    when :queen
      piece == :queen
    when :king
      piece == :king
    when :knight
      piece == :knight
    end
  end
  
  protected
  
  attr_reader :color, :piece

  private

  def foul_input_guard_for(color)
    unless color == :light || color == :dark 
      raise "Foul color input. The square color must be either :dark or :light, not #{color}"
    end
  end

  def foul_input_guard(piece, extra_reminder: :pending_abstraction)
    unless piece.belongs_to? BoardMaker.set_of_chess_pieces
      raise "The #{piece} is not in the set of domain pieces" 
    end
  end
end
