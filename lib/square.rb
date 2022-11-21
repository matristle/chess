require_relative 'temporary_patch'

class Square
  attr_reader :piece
  using TemporaryPatch

  def initialize(color:, status: :empty)
    foul_input_guards_for(color, status)

    @color  = color
    @status = status
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
    self.status == other.status && self.occupied?
  end

  def host(piece)
    raise "The #{piece} is not in the set of domain pieces" unless piece.belongs_to? set_of_chess_pieces
    
    @piece = piece
  end
  
  protected
  
  attr_reader :color, :status

  private

  def set_of_chess_pieces
    %i(pawn rook bishop queen king knight)
  end

  def foul_input_guards_for(color, status)
    unless color == :light || color == :dark 
      raise "Foul color input. The square color must be either :dark or :light, not #{color}"
    end
    
    unless status == :empty || status == :occupied 
      raise "Foul status input. Status must be either :empty or :occupied, not #{status}"
    end
  end
end
