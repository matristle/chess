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

  def display_board(fen)
    board_display_data = load_board_from_fen(fen)

    board_display_data.each do |rank|
      rank = rank.inject("") do |memo, square|
        memo << square.blue
      end

      puts rank
    end
  end

  def load_board_from_fen(fen)
    piece_placement_data = fen.piece_placement_data.split("/")
    empty_board_display_data = load_empty_board

    empty_board_display_data.map do |rank|
      rank_piece_placement_data = piece_placement_data.shift.chars
      load_rank(rank, rank_piece_placement_data)
    end
  end

  def load_rank(rank, rank_piece_placement_data)
    skip_count = 0

    rank.map do |square_data|
      char = rank_piece_placement_data[0]

      if "R N B Q K".include?(char) || "r n b q k".include?(char)
        rank_piece_placement_data.shift

        replacing_square_data = square_data.split(" ").insert(1, "#{char} ").join
      else
        replacing_square_data = square_data
        
        skip_count += 1

        if skip_count == char.to_i
          skip_count = 0
          rank_piece_placement_data.shift
        end
      end

      replacing_square_data
    end.flatten
  end

  def display_empty_board
    empty_board_display_data = load_empty_board

    empty_board_display_data.each do |rank|
      rank.each { |square| print square }

      print "\n"
    end
  end

  def load_empty_board
    checker_color_values.map do |rank|
      rank.map do |square_color|
        if square_color == :light
          empty_light_square
        else
          empty_dark_square
        end
      end
    end
  end

  def checker_color_values
    board.collect_checker_color_values
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
fen = FEN.new("rnbqkbnr/8/8/8/8/8/8/RNBQKBNR", nil)

board_display.display_board(fen)




