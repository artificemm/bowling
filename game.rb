#!/usr/bin/env ruby
# frozen_string_literal: true

require './lib/frame'
require './lib/roll'

class Game
  class Error < StandardError; end
  class ExcededRollError < StandardError; end
  LINE_SEPARATOR = "\n"
  VALUE_SEPARATOR = "\t"

  @instance = new
  
  private_class_method :new
  
  def self.instance
    @instance
  end

  attr_accessor :data

  def data
    @data ||= {}
  end

  def input_from_file(filename)
    @input_file = File.open(filename)
    #check for existing file, handle missing arguments
  end

  def init_game_data
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


filename, *following_args = ARGV
check_for_file_input_data
game = Game.instance
