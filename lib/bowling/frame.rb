module Bowling
  class Frame
    attr_accessor :first_roll, :second_roll

    def initialize(fr: 0, sr: 0)
      @first_roll   = fr
      @second_roll  = sr
      @second_roll = 0 if @first_roll == 10
    end

    def strike?
      @first_roll == 10 && @second_roll == 0
    end

    def spare?
      (10 - (@first_roll + @second_roll)) == 0
    end

    def open?
      !strike? && !spare?
    end

    def total
      return 10 unless open?
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
end
