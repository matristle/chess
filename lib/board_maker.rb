require_relative 'coordinate'
require_relative 'square'

class BoardMaker
  def make
    bind_empty_square_placeholders_to_coordinates
    replace_placeholders_with_colored_squares
    
    detach_and_return product
  end

  def detach_and_return(product)
    result = product
    @product = nil
    
    result
  end

  def self.set_of_chess_pieces
    [Pawn, Rook, Knight, Bishop, Queen, King]
  end

  def setup_pieces_on(board)
    setup_pieces_for(:white, board)
    setup_pieces_for(:black, board)
  end

  private

  attr_reader :product
  
  def bind_empty_square_placeholders_to_coordinates
    @product = collected_coordinates.map { |coordinate| [coordinate, :empty] }.to_h
  end

  def collected_coordinates
    collected_coordinate_symbols.map { |symbol| make_coordinate(symbol) }
  end

  def make_coordinate(symbol)
    Coordinate.new(symbol)
  end

  def collected_coordinate_symbols
    file_letters.product(rank_numbers)
                .map(&:join)
                .map(&:to_sym)
  end

  def file_letters
    ('a'..'h').to_a
  end

  def rank_numbers
    ('1'..'8').to_a
  end

  def replace_placeholders_with_colored_squares
    rank_numbers.map(&:to_i).each do |rank_number|
      if rank_number.odd?
        apply_dark_light_checker_pattern_at(rank_number:)
      else
        apply_light_dark_checker_pattern_at(rank_number:)
      end
    end
  end
  
  def apply_dark_light_checker_pattern_at(rank_number:)
    apply_checker_pattern_at(rank_number:, first_color: :dark, second_color: :light)
  end
  
  def apply_light_dark_checker_pattern_at(rank_number:)
    apply_checker_pattern_at(rank_number:, first_color: :light, second_color: :dark)
  end
  
  def apply_checker_pattern_at(rank_number:, first_color:, second_color:)
    odd_number_squares_at(rank_number:).each  { |coordinate| @product[coordinate]  = make_square(first_color)  }
    even_number_squares_at(rank_number:).each { |coordinate| @product[coordinate]  = make_square(second_color) }
  end

  def make_square(color)
    Square.new(color:)
  end
  
  def odd_number_squares_at(rank_number:)
    coordinate_references_at(rank_number:, board: product).select { |coordinate| file_to_number(coordinate.file).to_i.odd?  }
  end
  
  def even_number_squares_at(rank_number:)
    coordinate_references_at(rank_number:, board: product).select { |coordinate| file_to_number(coordinate.file).to_i.even? }
  end

  def file_to_number(file)
    Coordinate.file_to_number(file)
  end

  def coordinate_references_at(rank_number:, board:)
    coordinates(board).select { |coordinate| coordinate.rank == rank_number.to_s }
  end

  def coordinates(board)
    board.keys
  end

  def setup_pieces_for(color, board)
    self.class.set_of_chess_pieces.each_with_index { |piece_class, index| piece_class.setup_on(board, color, index - 1) }
  end
end
