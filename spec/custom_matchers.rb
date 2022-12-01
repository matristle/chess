module CustomMatchers
  extend RSpec::Matchers::DSL
  
  # Square matchers

  matcher :have_a_white_piece do
    match { |square| square.white_piece_here? }
  end
  matcher :have_a_black_piece do
    match { |square| square.black_piece_here? }
  end


  # Board matchers
  
  matcher :have_a_white_piece_on do |coordinate|
    match { |board| board.white_piece_on?(coordinate) }
  end
  matcher :have_a_black_piece_on do |coordinate|
    match { |board| board.black_piece_on?(coordinate) }
  end

  matcher :have_a_pawn_on do |coordinate|
    match { |board| board.pawn_on?(coordinate) }
  end
  matcher :have_a_rook_on do |coordinate|
    match { |board| board.rook_on?(coordinate) }
  end
  matcher :have_a_knight_on do |coordinate|
    match { |board| board.knight_on?(coordinate) }
  end
  matcher :have_a_bishop_on do |coordinate|
    match { |board| board.bishop_on?(coordinate) }
  end
  matcher :have_a_queen_on do |coordinate|
    match { |board| board.queen_on?(coordinate) }
  end
  matcher :have_a_king_on do |coordinate|
    match { |board| board.king_on?(coordinate) }
  end

  matcher :have_a_dark_square_on do |coordinate|
    match { |board| board.dark_square_on?(coordinate) }
  end
  matcher :have_a_light_square_on do |coordinate|
    match { |board| board.light_square_on?(coordinate) }
  end
end
