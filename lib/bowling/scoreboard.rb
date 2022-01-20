module Bowling
  class Scoreboard
    SPACER = "\t"
    DOUBLE_SPACER = "\t\t"

    def initialize(frames, score)
      @data   = frames
      @score  = score
    end

    def run
      puts header
      @data.each do |player, rolling|
        puts player
        puts ["Pinfalls", rolling].join(SPACER)
        puts ["Score", @score[player]].join(DOUBLE_SPACER)
      end
      return true
    end

    private
    def header
      ["Frame", (1..10).to_a].join(DOUBLE_SPACER)
    end
  end
end
