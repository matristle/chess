require_relative 'board_maker'

class Board
  def initialize(board_maker)
    @board_maker = board_maker
    @structure = board_maker.make
  end

  def square_at(coordinate)
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
    (1..8).all? do |rank_number|
      if rank_number.odd?
        dark_light_pattern_at?(rank_number:)
      else 
        light_dark_pattern_at?(rank_number:)
      end
    end
  end

  def setup_pieces
    setup_pieces_for(:white)
    setup_pieces_for(:black)
  end

  def setup_pieces_for(piece_color)
    i, j = 0, 7

    board_maker.class.set_of_chess_pieces.each do |piece|
      if piece == :pawn
        case piece_color
        when :white
          setup_pawns(piece, 2)
        when :black
          setup_pawns(piece, 7)
        end
      else
        case piece_color
        when :white
          current_leftside_coordinate  = coordinate_references_at(rank_number: 1)[i]
          current_rightside_coordinate = coordinate_references_at(rank_number: 1)[j]  
        when :black
          current_leftside_coordinate  = coordinate_references_at(rank_number: 8)[i]
          current_rightside_coordinate = coordinate_references_at(rank_number: 8)[j] 
        end
        
        case piece
        when :queen
          square_at(current_leftside_coordinate).host(piece) 
        when :king
          square_at(current_rightside_coordinate).host(piece) 
        else
          square_at(current_leftside_coordinate).host(piece) 
          square_at(current_rightside_coordinate).host(piece)

          i += 1; j -= 1 
        end
      end
    end
  end

  def setup_pawns(pawn, rank_number)
    coordinate_references_at(rank_number:).each { |coordinate| square_at(coordinate).host(pawn) }
  end

  private
  
  attr_reader :structure, :board_maker
  
  def coordinates
    structure.keys
  end

  def squares
    structure.values
  end

  def dark_light_pattern_at?(rank_number:)
    dark_on_odd_number_squares?(rank_number:) && light_on_even_number_squares?(rank_number:)
  end

  def dark_on_odd_number_squares?(rank_number:)
    odd_number_squares_at(rank_number:).all? { |coordinate| square_at(coordinate).dark? }
  end

  def light_on_even_number_squares?(rank_number:)
    even_number_squares_at(rank_number:).all? { |coordinate| square_at(coordinate).light? }
  end

  def light_dark_pattern_at?(rank_number:)
    light_on_odd_number_squares?(rank_number:) && dark_on_even_number_squares?(rank_number:)
  end

  def light_on_odd_number_squares?(rank_number:)
    odd_number_squares_at(rank_number:).all? { |coordinate| square_at(coordinate).light? }
  end

  def dark_on_even_number_squares?(rank_number:)
    even_number_squares_at(rank_number:).all? { |coordinate| square_at(coordinate).dark? }
  end

  def odd_number_squares_at(rank_number:)
    coordinate_references_at(rank_number:).select { |coordinate| Coordinate.file_to_number(coordinate.file).to_i.odd?  }
  end
  
  def even_number_squares_at(rank_number:)
    coordinate_references_at(rank_number:).select { |coordinate| Coordinate.file_to_number(coordinate.file).to_i.even? }
  end

  def coordinate_references_at(rank_number:)
    coordinates(structure).select { |coordinate| coordinate.rank == rank_number.to_s }
  end

  def coordinates(board)
    board.keys
  end
end
