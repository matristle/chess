require_relative 'board_maker'

class Board
  def initialize
    @board_structure = board_maker.make_with_coordinates
  end

  def [](coordinate)
    board_structure[coordinate]
  end

  def size
    board_structure.size
  end

  def coordinate?(coordinate)
    board_structure.key?(coordinate)
  end

  def transport(destination_coordinate:)
    @board_structure[destination_coordinate] = selected_piece if coordinate?(destination_coordinate)
  end

  def piece_at?(coordinate)
    self[coordinate.to_sym] != EMPTY
  end

  def any_piece_watching_at?(coordinate)
    self[coordinate.to_sym].watchers?
  end

  private

  attr_reader :board_structure, :selected_piece

  EMPTY = ''.freeze

  def board_maker
    BoardMaker.new
  end
end
