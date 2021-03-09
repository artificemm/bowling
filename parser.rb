class Parser
  LINE_SEPARATOR = "\n"
  VALUE_SEPARATOR = "\t"
  attr_accessor :file, :game_data

  def initialize(filename)
    @file = File.open(filename)
    @game_data = Hash.new
  end

  def run
    @file.readlines(chomp: true).each do |line|
      player, roll = line.split(VALUE_SEPARATOR)
      if @game_data[player].nil?
        @game_data[player] = []
      end
      @game_data[player].push(Roll.new(roll))
    end
    @game_data
  end
end
