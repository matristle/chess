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

  def self.leftside(index)
    index
  end
  
  def self.kingside(index)
    index
  end
  
  def self.rightside(index)
    7 - leftside(index)
  end

  def self.setup_on(board, color, index)
    board.place(self.new(color), current_leftside_coordinate(board, color, index)) 
    board.place(self.new(color), current_rightside_coordinate(board, color, index)) 
  end
  
  def self.current_leftside_coordinate(board, color, index)
    case color
    when :white
      board.coordinates_at(rank_number: 1)[leftside index]
    when :black
      board.coordinates_at(rank_number: 8)[leftside index]
    end
  end

  def self.current_rightside_coordinate(board, color, index)
    case color
    when :white
      board.coordinates_at(rank_number: 1)[rightside index]      
    when :black
      board.coordinates_at(rank_number: 8)[rightside index] 
    end
  end


  private

  attr_reader :color

  def foul_input_guard_for(color)
    unless color == :white || color == :black 
      raise "Foul color input. The piece color must be either :black or :white, not #{color}"
    end
  end
end
