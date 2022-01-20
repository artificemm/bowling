require_relative 'lib/bowling'

filename, *following_args = ARGV
raise(Errno::ENOENT, "You must provide a txt file with the bowling data.") if filename.nil?
game = Bowling::Game.new(filename)
game.play
