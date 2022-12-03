require_relative 'custom_matchers'
require_relative '../lib/board_maker'
require_relative '../lib/board'

describe BoardMaker do
  include CustomMatchers

  subject(:board_maker) { BoardMaker.new }

  let(:board)          { Board.new(board_maker, piece_arranger) }
  let(:piece_arranger) { PieceArranger.new }

  context 'when board is made' do
    it 'has a dark square on a1' do
      a1 = Coordinate.new(:a1)

      expect(board).to have_a_dark_square_on a1
    end

    it 'has a light square on b1' do
      b1 = Coordinate.new(:b1)

      expect(board).to have_a_light_square_on b1
    end

    it 'has a dark square on c1' do
      c1 = Coordinate.new(:c1)

      expect(board).to have_a_dark_square_on c1
    end

    it 'has a light square on d1' do
      d1 = Coordinate.new(:d1)

      expect(board).to have_a_light_square_on d1
    end

    it 'has a dark square on e1' do
      e1 = Coordinate.new(:e1)

      expect(board).to have_a_dark_square_on e1
    end
    
    it 'has a light square on f1' do
      f1 = Coordinate.new(:f1)

      expect(board).to have_a_light_square_on f1
    end

    it 'has a dark square on g1' do
      g1 = Coordinate.new(:g1)

      expect(board).to have_a_dark_square_on g1
    end
    
    it 'has a light square on h1' do
      h1 = Coordinate.new(:h1)
      
      expect(board).to have_a_light_square_on h1
    end

    it 'has a light square on a2' do
      a2 = Coordinate.new(:a2)

      expect(board).to have_a_light_square_on a2
    end

    it 'has a dark square on b2' do
      b2 = Coordinate.new(:b2)

      expect(board).to have_a_dark_square_on b2
    end

    it 'has a light square on c2' do
      c2 = Coordinate.new(:c2)

      expect(board).to have_a_light_square_on c2
    end

    it 'has a dark square on d2' do
      d2 = Coordinate.new(:d2)

      expect(board).to have_a_dark_square_on d2
    end
    
    it 'has a light square on e2' do
      e2 = Coordinate.new(:e2)

      expect(board).to have_a_light_square_on e2
    end

    it 'has a dark square on f2' do
      f2 = Coordinate.new(:f2)

      expect(board).to have_a_dark_square_on f2
    end
    
    it 'has a light square on g2' do
      g2 = Coordinate.new(:g2)
      
      expect(board).to have_a_light_square_on g2
    end
    
    it 'has a dark square on h2' do
      h2 = Coordinate.new(:h2)

      expect(board).to have_a_dark_square_on h2
    end

    it 'has a dark square on a3' do
      a3 = Coordinate.new(:a3)

      expect(board).to have_a_dark_square_on a3
    end

    it 'has a light square on b3' do
      b3 = Coordinate.new(:b3)

      expect(board).to have_a_light_square_on b3
    end

    it 'has a dark square on c3' do
      c3 = Coordinate.new(:c3)

      expect(board).to have_a_dark_square_on c3
    end

    it 'has a light square on d3' do
      d3 = Coordinate.new(:d3)

      expect(board).to have_a_light_square_on d3
    end

    it 'has a dark square on e3' do
      e3 = Coordinate.new(:e3)

      expect(board).to have_a_dark_square_on e3
    end
    
    it 'has a light square on f3' do
      f3 = Coordinate.new(:f3)

      expect(board).to have_a_light_square_on f3
    end

    it 'has a dark square on g3' do
      g3 = Coordinate.new(:g3)

      expect(board).to have_a_dark_square_on g3
    end
    
    it 'has a light square on h3' do
      h3 = Coordinate.new(:h3)
      
      expect(board).to have_a_light_square_on h3
    end
  end
end
