require_relative 'coordinate'
require_relative 'square'

class BoardMaker
  def make
    bind_empty_square_placeholders_to_coordinates
    replace_placeholders_with_colored_squares
    
    product
  end

  def self.set_of_chess_pieces
    %i(pawn rook knight bishop queen king)
  end

  private

  attr_reader :product
  
  def bind_empty_square_placeholders_to_coordinates
    @product = collected_coordinates.map { |coordinate| [coordinate, :empty] }
                                    .to_h
  end

  def collected_coordinates
    collected_coordinate_symbols.map { |symbol| Coordinate.new(symbol) }
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
    (1..8).each do |rank_number|
      if rank_number.odd?
        apply_dark_light_pattern(rank_number)
      else
        apply_light_dark_pattern(rank_number)
      end
    end
  end
  
  def apply_dark_light_pattern(rank_number)
    apply_pattern(rank_number:, first_color: :dark, second_color: :light)
  end
  
  def apply_light_dark_pattern(rank_number)
    apply_pattern(rank_number:, first_color: :light, second_color: :dark)
  end
  
  def apply_pattern(rank_number:, first_color:, second_color:)
    odd_number_squares_at(rank_number).each  { |coordinate| @product[coordinate]  = Square.new(color: first_color)  }
    even_number_squares_at(rank_number).each { |coordinate| @product[coordinate]  = Square.new(color: second_color) }
  end
  
  def odd_number_squares_at(rank_number)
    coordinate_references_at(rank_number).select { |coordinate| Coordinate.file_to_number(coordinate.file).to_i.odd?  }
  end
  
  def even_number_squares_at(rank_number)
    coordinate_references_at(rank_number).select { |coordinate| Coordinate.file_to_number(coordinate.file).to_i.even? }
  end

  def coordinate_references_at(rank_number)
    coordinates(product).select { |coordinate| coordinate.rank == rank_number.to_s }
  end

  def coordinates(board)
    board.keys
  end
end
