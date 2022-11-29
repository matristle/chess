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
  
  matcher :have_a_white_piece_at do |coordinate|
    match { |board| board.white_piece_at?(coordinate) }
  end
  matcher :have_a_black_piece_at do |coordinate|
    match { |board| board.black_piece_at?(coordinate) }
  end

  matcher :have_a_pawn_at do |coordinate|
    match { |board| board.pawn_at?(coordinate) }
  end
  matcher :have_a_rook_at do |coordinate|
    match { |board| board.rook_at?(coordinate) }
  end
  matcher :have_a_knight_at do |coordinate|
    match { |board| board.knight_at?(coordinate) }
  end
  matcher :have_a_bishop_at do |coordinate|
    match { |board| board.bishop_at?(coordinate) }
  end
  matcher :have_a_queen_at do |coordinate|
    match { |board| board.queen_at?(coordinate) }
  end
  matcher :have_a_king_at do |coordinate|
    match { |board| board.king_at?(coordinate) }
  end

  matcher :have_a_dark_square_at do |coordinate|
    match { |board| board.dark_square_at?(coordinate) }
  end
  matcher :have_a_light_square_at do |coordinate|
    match { |board| board.light_square_at?(coordinate) }
  end
end
