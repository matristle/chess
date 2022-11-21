require_relative 'coordinate'
require_relative 'square'

class BoardMaker
  def make
    @product = bind_empty_square_placeholders_to_coordinates
    replace_placeholders_with_colored_squares
    
    @product
  end

  private
  
  def bind_empty_square_placeholders_to_coordinates
    collected_coordinates.map { |coordinate| [coordinate, :empty] }
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
      @rank = @product.select { |coordinate| coordinate.rank == rank_number.to_s }

      if rank_number.odd?
        apply_dark_light_pattern
      else
        apply_light_dark_pattern
      end
      
      @product.merge!(@rank)
    end
  end

  def apply_dark_light_pattern
    apply_pattern(first_color: :dark, second_color: :light)
  end

  def apply_light_dark_pattern
    apply_pattern(first_color: :light, second_color: :dark)
  end

  def apply_pattern(first_color:, second_color:)
    odd_number_squares = @rank.select { |coordinate| Coordinate.file_to_number(coordinate.file).to_i.odd? }
    odd_number_squares.keys.each { |coordinate| odd_number_squares[coordinate] = Square.new(color: first_color) }
   
    even_number_squares = @rank.select { |coordinate| Coordinate.file_to_number(coordinate.file).to_i.even? }
    even_number_squares.keys.each { |coordinate| even_number_squares[coordinate] = Square.new(color: second_color) }
      

    @rank.merge!(odd_number_squares, even_number_squares)
  end
end
