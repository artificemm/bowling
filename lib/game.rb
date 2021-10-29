require 'frame'
require 'roll'

class Game

  @instance = new

  private_class_method :new

  def self.instance
    @instance
  end

  class Error < StandardError; end
  class ExcededRollError < StandardError; end
  LINE_SEPARATOR = "\n"
  VALUE_SEPARATOR = "\t"

  def input_file(filename)
    @input_file = File.open(filename)
  end

  def init_game_data
    @game_data = {}
    @input_file.readlines(chomp: true).each do |line|
      player, roll = line.split(VALUE_SEPARATOR)
      if @game_data[player].nil?
        @game_data[player] = {}
        @game_data[player][rolls] = []
      end
      raise ExcededRollError, 'Player has exceded allowed rolls for this game' if @game_data[player][rolls].size > 21
      throw = Throw.new(roll)
      @game_data[player][rolls].push(throw.output_value)
    end
  end

  def build_frames
    @game_data.each do |player, data|
      @game_data[player][frames] = {}
      # (1..10).each do |frame_number|
      #   frame = Frame.new
      #   frame.first_roll = 
      #   @game_data[player][frames][frame_number]
      # end
      first_roll, second_roll = data.shift(2)
      frame = Frame.new
      frame.first_roll = first_roll
      if frame.is_strike?
        data.unshift(second_roll)
        next
      else
        #WIP
      end
    end
  end

  def create_frames
    players = @game_data.keys
  end
end
