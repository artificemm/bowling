# Bowling challenge
# Applicant: Roberto Ruiz, artificemm@gmail.com
# Ruby version: 2.7.2

class Game
  require_relative 'frame'
  require_relative 'parser'
  require_relative 'roll'
  require_relative 'scoreboard'

  def initialize(filename)
    @filename = filename
  end

  def play
    validate_filename
    parse_filename
    initialize_hashes
    build_frames
    scoreboard = Scoreboard.new(@frames, @scores)
    scoreboard.run
  end

  private

  def current_player_score(player, score)
    @scores[player].push(score)
  end

  def current_player_frame(player, first_roll, second_roll)
    @frames[player].push(first_roll, second_roll)
  end

  def validate_filename
    raise(Errno::ENOENT, "You must provide a txt file with the bowling data.") if @filename.nil?
  end

  def parse_filename
    parser = Parser.new(@filename)
    @data = parser.run
  end

  def initialize_hashes
    @players           = @data.keys
    @frames            = Hash.new
    @scores            = Hash.new

    @players.each do |player|
      @frames[player]           = []
      @scores[player]           = []
    end
  end

  def build_frames
    @data.each do |player, rolls|
      @current_frame = 0
      @rolls = rolls.map(&:to_i)
      while @rolls.size > 0  && @current_frame <= 9
        a, b = @rolls.shift(2)
        frame = Frame.new(fr: a.to_i, sr: b.to_i)
        case
          when frame.strike?
            @rolls.unshift(b)
            current_player_frame(player, '', 'X')
            current_player_score(player, frame.total + @rolls[0].to_i + @rolls[1].to_i)
          when frame.spare?
            current_player_frame(player, a, '/')
            current_player_score(player, frame.total + @rolls[0].to_i)
          when frame.open?
            a, b = a, b
            current_player_frame(player, a, b)
            current_player_score(player, frame.total)
        end
        @scores[player][@current_frame] += @scores[player][@current_frame - 1] unless @current_frame.zero?
        @current_frame += 1
      end
    end
  end
end
