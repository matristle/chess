require_relative '../lib/board_maker'

describe BoardMaker do
  it 'makes coordinate keys having empty squares' do
    board_product = { :a1=>:empty, :a2=>:empty, :a3=>:empty, :a4=>:empty, :a5=>:empty, :a6=>:empty, :a7=>:empty, :a8=>:empty, :b1=>:empty, :b2=>:empty, :b3=>:empty, :b4=>:empty, :b5=>:empty, :b6=>:empty, :b7=>:empty, :b8=>:empty, :c1=>:empty, :c2=>:empty, :c3=>:empty, :c4=>:empty, :c5=>:empty, :c6=>:empty, :c7=>:empty, :c8=>:empty, :d1=>:empty, :d2=>:empty, :d3=>:empty, :d4=>:empty, :d5=>:empty, :d6=>:empty, :d7=>:empty, :d8=>:empty, :e1=>:empty, :e2=>:empty, :e3=>:empty, :e4=>:empty, :e5=>:empty, :e6=>:empty, :e7=>:empty, :e8=>:empty, :f1=>:empty, :f2=>:empty, :f3=>:empty, :f4=>:empty, :f5=>:empty, :f6=>:empty, :f7=>:empty, :f8=>:empty, :g1=>:empty, :g2=>:empty, :g3=>:empty, :g4=>:empty, :g5=>:empty, :g6=>:empty, :g7=>:empty, :g8=>:empty, :h1=>:empty, :h2=>:empty, :h3=>:empty, :h4=>:empty, :h5=>:empty, :h6=>:empty, :h7=>:empty, :h8=>:empty }

    expect(BoardMaker.new.make).to eq(board_product)
  end
end
