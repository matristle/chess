class Piece
  def initialize(color)
    foul_input_guard_for(color)

    @color = color
  end

  def white?
    color == :white
  end

  def black?
    color == :black
  end

  private

  attr_reader :color

  def foul_input_guard_for(color)
    unless color == :white || color == :black 
      raise "Foul color input. The piece color must be either :black or :white, not #{color}"
    end
  end
end
