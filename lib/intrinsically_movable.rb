module IntrinsicallyMovable
  def same_file_or_rank?
    same_file? || same_rank?
  end

  def same_file?
    current_coordinate.file == destination_coordinate.file
  end

  def same_rank? 
    current_coordinate.rank == destination_coordinate.rank
  end

  def same_file_rank_steps?
    rank_absolute_difference == file_absolute_difference
  end

  def coordinate_difference(orientation:)
    case orientation
    when :rank
      destination_coordinate.rank.to_i - current_coordinate.rank.to_i
    when :file
      destination_coordinate.file_to_number - current_coordinate.file_to_number
    end
  end

  def rank_absolute_difference
    coordinate_difference(orientation: :rank).abs
  end

  def file_absolute_difference
    coordinate_difference(orientation: :file).abs
  end

  def one_step?
    rank_absolute_difference == 1 || file_absolute_difference == 1
  end

  def l_shape?
    (rank_absolute_difference == 1 && file_absolute_difference == 2) || (rank_absolute_difference == 2 && file_absolute_difference == 1)
  end

  def two_steps?
    rank_absolute_difference == 2 || file_absolute_difference == 2
  end
end
