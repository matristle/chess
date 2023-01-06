class FEN
  attr_reader :piece_placement_data, :castling_availability_data

  def initialize(piece_placement_data, castling_availability_data)
    @piece_placement_data       = piece_placement_data
    @castling_availability_data = castling_availability_data
  end

  def to_s
    piece_placement_data + " " + castling_availability_data
  end
end
