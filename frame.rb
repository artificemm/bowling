class Frame
  def initialize(first_roll = 0, second_roll = 0)
    @first_roll   = first_roll
    @second_roll  = second_roll
  end

  def strike?
    @first_roll == 10
  end

  def spare?
    (10 - @first_roll - @second_roll) == 0
  end

  def open?
    !strike? && !spare?
  end

  def total
    @first_roll + @second_roll
  end

  def inspect
    if open?
      total
    else
      10
    end
  end
end