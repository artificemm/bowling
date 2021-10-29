# frozen_string_literal: true

class Roll
  class InvalidValue < StandardError; end
  NUMERICAL_VALUES = ('0'..'10').to_a
  FAULT_F = 'F'
  FAULT_DASH = '-'
  FAULTS = [FAULT_F, FAULT_DASH]
  STRIKE = 'X'
  ALPHANUMERICAL_VALUES = [FAULT_DASH, FAULT_F, STRIKE]
  VALID_THROWS = [*NUMERICAL_VALUES, *ALPHANUMERICAL_VALUES]

  attr_reader :input_value, :output_value

  def initialize(value)
    check = value.to_s.upcase
    @input_value = check if valid_throw(check)
    @output_value = parser(@input_value)
  end

  private
  def valid_throw(value)
    return true if VALID_THROWS.include? value
    raise InvalidValue, 'Unexpected value during parsing. Only 0-10, F, -, X are allowed'
  end

  def parser(value)
    case value
    when *NUMERICAL_VALUES
      value.to_i
    when *FAULTS
      0
    when STRIKE
      10
    end
  end
end
