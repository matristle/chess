class Piece
  def initialize(color)
    foul_input_guard_for(color)

    @color = color
    @activity_status = :not_moved_yet
  end

  def white?
    color == :white
  end

  def black?
    color == :black
  end

  def mark_as_moved_before
    @activity_status = :moved_before
  end

  def not_moved_before?
    !moved_before?
  end

  def moved_before?
    activity_status == :moved_before
  end

  def same_color_as?(other)
    self.color == other.color
  end

  def different_color_from?(other)
    !same_color_as?(other)
  end

  protected

  attr_reader :color

  def foul_input_guard_for(color)
    unless color == :white || color == :black 
      raise "Foul color input. The piece color must be either :black or :white, not #{color}"
    end
  end

  private
  
  attr_reader :activity_status
end
