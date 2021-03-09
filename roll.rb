class Roll
  attr_accessor :value

  def initialize(value)
    if ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "F", "-"].any?(value)
      @value = value
      parse_value(@value)
    else
      raise TypeError, "Only expecting string values from 0..10, F or -"
    end
  end

  def parse_value(value)
    case value
    when ("0".."10")
      @value = value.to_i
    when 'F', '-'
      @value = 0
    end
  end

  def inspect
    @value
  end
end
