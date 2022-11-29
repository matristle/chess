module CustomMatchers
  extend RSpec::Matchers::DSL
  
  matcher :have_a_white_piece do
    match { be_white_piece_here }
  end
  matcher :have_a_black_piece do
    match { be_black_piece_here }
  end
end
