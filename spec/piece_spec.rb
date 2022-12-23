require_relative '../lib/piece'
require_relative '../lib/king'
require_relative '../lib/board'
require_relative '../lib/board_maker'
require_relative '../lib/piece_arranger'
require_relative '../lib/move_validator'
require_relative '../lib/coordinate'

describe Piece do
  let(:board) { Board.new(board_maker:, piece_arranger:, move_validator:) }
    let(:board_maker)    { BoardMaker.new }
    let(:piece_arranger) { PieceArranger.new }
    let(:move_validator) { MoveValidator.new }

  it 'is white' do
    expect(Piece.new(:white)).to be_white
  end

  it 'is black' do
    expect(Piece.new(:black)).to be_black
  end

  it "hasn't moved before" do
    expect(Piece.new(:white).moved_before?).to be(false)
  end

  it "has moved before" do
    initial_coordinate = Coordinate.new(:e1)
    destination_coordinate = Coordinate.new(:e2)
    king = King.new(:white)
    board.place(king, initial_coordinate)
    board.move_piece(initial_coordinate, destination_coordinate)

    expect(king.moved_before?).to be(true)
  end

  it 'can have the same color as another piece' do
    first_piece  = Piece.new(:black)
    second_piece = Piece.new(:black)

    expect(first_piece).to be_same_color_as second_piece
  end

  it 'can have a different color than another piece' do
    first_piece  = Piece.new(:black)
    second_piece = Piece.new(:white)

    expect(first_piece).to be_different_color_from second_piece
  end

  context 'when passing in unwanted inputs during a piece initialization' do
    context 'and the foul input is for color' do
      let(:not_to_be_created_piece) { Piece.new(foul_color_input) }
      let(:foul_color_input) { :green }

      it 'raises foul color input error' do
        expect { not_to_be_created_piece }.to raise_error("Foul color input. The piece color must be either :black or :white, not #{foul_color_input}")
      end
    end
  end
end
