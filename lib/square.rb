class Square
  def initialize(color:, status: :empty)
    foul_input_guards_for(color, status)

    @color  = color
    @status = status
  end

  def white?
    color == :white
  end

  def black?
    color == :black
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

  def has_a_piece_like?(other)
    self.status == other.status
  end
  
  protected
  
  attr_reader :color, :status

  private

  def foul_input_guards_for(color, status)
    unless color == :white || color == :black 
      raise "Foul color input. The square color must be either :black or :white, not #{color}"
    end
    
    unless status == :empty || status == :occupied 
      raise "Foul status input. Status must be either :empty or :occupied, not #{status}"
    end
  end
end
