module Bowling
  class Roll
    STRING_NUMBERS = (0..10).to_a
    INTEGER_NUMBERS = ('0'..'10').to_a
    FAULTS = ['F', '-']
    VALID_ROLES = [*STRING_NUMBERS, *INTEGER_NUMBERS, *FAULTS]
    attr_accessor :value

    def initialize(value)
      raise TypeError, "Only expecting string values from 0..10, F or -" unless VALID_ROLES.include?(value)
      @value = parse_value(value)
    end

    def inspect
      @value
    end

    def to_i
      @value.to_i
    end

    private
    def parse_value(value)
      case value
      when *INTEGER_NUMBERS
        return value
      when *STRING_NUMBERS
        return value.to_i
      when *FAULTS
        return 0
      end
    end
  end
end
