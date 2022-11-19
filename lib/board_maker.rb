class BoardMaker
  def make
    @product = bind_empty_square_placeholders_to_coordinates
    replace_placeholders_with_colored_squares
    
    @product
  end

  def self.file_to_number(file_letter)
    file_number_mapping[file_letter.to_sym].to_s
  end
  
  def self.file_number_mapping
    { a: 1, b: 2, c: 3, d: 4, e: 5, f: 6, g: 7, h: 8 }
  end

  private
  
  def bind_empty_square_placeholders_to_coordinates
    collected_coordinates.map { |coordinate| [coordinate, :empty] }
                         .to_h
  end

  def collected_coordinates
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
    (1..8).each do |row_number|
      @row = @product.select { |coordinate| coordinate[1] == row_number.to_s }

      if row_number.odd?
        apply_black_white_pattern
      else
        apply_white_black_pattern
      end
      
      @product.merge!(@row)
    end
  end

  def apply_black_white_pattern
    apply_pattern(first_color: :dark, second_color: :light)
  end

  def apply_white_black_pattern
    apply_pattern(first_color: :light, second_color: :dark)
  end

  def apply_pattern(first_color:, second_color:)
    @odd_number_squares = @row.select { |coordinate| BoardMaker.file_to_number(coordinate[0]).to_i.odd? }
    @odd_number_squares.keys.each { |coordinate| @odd_number_squares[coordinate] = Square.new(color: first_color) }
   
    @even_number_squares = @row.select { |coordinate| BoardMaker.file_to_number(coordinate[0]).to_i.even? }
    @even_number_squares.keys.each { |coordinate| @even_number_squares[coordinate] = Square.new(color: second_color) }
      

    @row.merge!(@odd_number_squares, @even_number_squares)
  end
end
