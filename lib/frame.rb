# frozen_string_literal: true

class Frame
  class AlreadyStriked < StandardError; end
  class OverflowValue < StandardError; end
  class InvalidValue < StandardError; end
  MIN_PER_FRAME = 0
  MAX_PER_FRAME = 10
  MAX_FIRST_ROLE = 10

  VALID_RANGE = (MIN_PER_FRAME..MAX_PER_FRAME)

  def first_roll=(value)
    @first_roll = value if check_first_roll(value)
  end

  def second_roll=(value)
    @second_roll = value if check_second_roll(value)
    @second_roll ||= 0
  end

  def is_open?
    !is_strike? && !is_spare?
  end

  def is_strike?
    MAX_FIRST_ROLE == @first_roll
  end

  def is_spare?
    MAX_PER_FRAME == total
  end

  def total
    @first_roll + @second_roll if both_values_present?
  end

  def is_complete?
    is_strike? || both_values_present?
  end

  private

  def check_first_roll(value)
    return true if VALID_RANGE.include? value
    raise InvalidValue, 'Value of the roll must be between 0 and 10 for the first roll'
  end

  def check_second_roll(value)
    raise AlreadyStriked, 'This frame has already a strike' if is_strike?
    raise InvalidValue, "Value of the second roll must be between 0 and #{pins_left}" unless valid_second_roll(value)
    pre_total = @first_roll + value
    raise OverflowValue, 'This frame has an invalid roll' if pre_total > 10
    return true if VALID_RANGE.include? pre_total
  end

  def pins_left
    MAX_FIRST_ROLE - @first_roll
  end

  def valid_second_roll(value)
    (0..pins_left).include? value
  end

  def both_values_present?
    !@first_roll.nil? && !@second_roll.nil?
  end
end
