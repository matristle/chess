require "colorize"
require_relative 'board'
require_relative 'board_maker'
require_relative 'piece_arranger'
require_relative 'move_validator'

class BoardDisplay
  attr_reader :board, :display_structure
  
  def initialize(board)
    @board = board
  end

  def load_board_from_fen
    fen_sequence = "8/8/8/8/8/8/8/8"
    piece_placement_info = fen_sequence.split("/")

  end

  def display_empty_light_square
    print empty_light_square
  end
  
  def display_empty_dark_square
    print empty_dark_square
  end

  def empty_light_square
    "  ".on_white
  end

  def empty_dark_square
    "  ".on_red
  end

  def display_dark_square_with_white(piece_symbol)
    print " #{piece_symbol} ".light_blue.on_red 
  end

  def display_dark_square_with_black(piece_symbol)
    print " #{piece_symbol} ".black.on_red 
  end

  def display_light_square_with_white(piece_symbol)
    print " #{piece_symbol} ".light_blue.on_light_white 
  end

  def display_light_square_with_black(piece_symbol)
    print " #{piece_symbol} ".black.on_light_white 
  end
end

    board_maker    = BoardMaker.new
    piece_arranger = PieceArranger.new
    move_validator = MoveValidator.new
  board = Board.new(board_maker:, piece_arranger:, move_validator:)
board_display = BoardDisplay.new(board)


board_display.display_structure

