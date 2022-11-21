require_relative 'board_maker'

class Board
  def initialize
    @structure = board_maker.make
  end

  def [](coordinate)
    structure[coordinate]
  end
  
  def empty?
    squares.all? { |square| square.empty? }
  end

  def number_of_squares
    squares.count { |square| square.is_a? Square }
  end

  def number_of_light_squares
    squares.count { |square| square.light? }
  end
  
  def number_of_dark_squares
    squares.count { |square| square.dark? }
  end

  def checkered?
    (1..8).each.all? do |rank_number|
      if rank_number.odd?
        dark_light_pattern_at?(rank_number:)
      else 
        light_dark_pattern_at?(rank_number:)
      end
    end
  end

  private
  
  attr_reader :structure
  
  def board_maker
    @board_maker ||= BoardMaker.new
  end

  def coordinates
    structure.keys
  end

  def squares
    structure.values
  end

  def rank(number)
    coordinates.select { |coordinate| coordinate.rank == number.to_s } 
  end

  def dark_light_pattern_at?(rank_number:)
    dark_on_odd_number_squares?(rank(rank_number)) && light_on_even_number_squares?(rank(rank_number))
  end

  def dark_on_odd_number_squares?(rank)
    odd_number_square_coordinates = rank.select do |coordinate|
      file_letter = coordinate.file
      file_number = Coordinate.file_to_number(file_letter).to_i

      file_number.odd?
    end

    dark_confirmed = odd_number_square_coordinates.all? do |coordinate|
      square = structure[coordinate]

      square.dark?
    end
  end

  def light_on_even_number_squares?(rank)
    even_number_square_coordinates = rank.select do |coordinate|
      file_letter = coordinate.file
      file_number = Coordinate.file_to_number(file_letter).to_i

      file_number.even?
    end

    light_confirmed = even_number_square_coordinates.all? do |coordinate|
      square = structure[coordinate]

      square.light?
    end
  end

  def light_dark_pattern_at?(rank_number:)
    light_on_odd_number_squares?(rank(rank_number)) && dark_on_even_number_squares?(rank(rank_number))
  end

  def light_on_odd_number_squares?(rank)
    odd_number_square_coordinates = rank.select do |coordinate|
      file_letter = coordinate.file
      file_number = Coordinate.file_to_number(file_letter).to_i

      file_number.odd?
    end

    light_confirmed = odd_number_square_coordinates.all? do |coordinate|
      square = structure[coordinate]

      square.light?
    end
  end

  def dark_on_even_number_squares?(rank)
    even_number_square_coordinates = rank.select do |coordinate|
      file_letter = coordinate.file
      file_number = Coordinate.file_to_number(file_letter).to_i

      file_number.even?
    end

    dark_confirmed = even_number_square_coordinates.all? do |coordinate|
      square = structure[coordinate]

      square.dark?
    end
  end
end
