class King < Piece
  def initialize(color)
    super

    @in_check_status = :not_in_check
  end

  def mark_as_in_check
    @in_check_status = :in_check
  end

  def in_check?
    in_check_status == :in_check
  end

  def not_in_check?
    !in_check?
  end

  private

  attr_reader :in_check_status
end
