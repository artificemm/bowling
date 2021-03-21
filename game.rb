# Bowling challenge
# Applicant: Roberto Ruiz, artificemm@gmail.com

  require_relative 'frame'
  require_relative 'parser'
  require_relative 'roll'
  require_relative 'scoreboard'
  require 'pry'

  def current_player_score(player, score)
    @scores[player].push(score)
  end

  def current_player_frame(player, first_roll, second_roll)
    @frames[player].push(first_roll, second_roll)
  end

  # 1) Open file from arguments
  filename, *following_args = ARGV
  if filename.nil?
    puts "Error. You must provide a txt file with the bowling data."
    raise Errno::ENOENT
  else
    # 2) Parse file into numeric values
    parser = Parser.new(filename)
    @data = parser.run
  end

  # 3) Set Frames with 2 rolls each. From frame 1 up to 9
  # 4) Frame 10 is a special case with up to 3 rolls, depends on either strike or spare rolls
  @players           = @data.keys
  @frames            = Hash.new
  @scores            = Hash.new

  # Initialize frames hash
  @players.each do |player|
    @frames[player]           = []
    @scores[player]           = []
  end

  # build frames by roll
  @data.each do |player, rolls|
    @current_frame = 0
    @rolls = rolls.map(&:to_i)
    while !@rolls.empty? #&& @current_frame <= 9
      a, b = @rolls.shift(2)
      f = Frame.new(a,b)
      if f.strike?
        @rolls.unshift(b)
        current_player_frame(player, '', 'X')
        current_player_score(player, 10 + @rolls[0].to_i + @rolls[1].to_i) # cast nils into 0's
      elsif f.spare?
        current_player_frame(player, a, '/')
        current_player_score(player,(10 + @rolls[0].to_i))
      else
        a, b = a.to_i, b.to_i
        current_player_frame(player, a, b)
        current_player_score(player, f.total)
      end
      if @current_frame > 0 && @current_frame < 9
        @scores[player][@current_frame] += @scores[player][@current_frame - 1]
      end
      @current_frame += 1
    end
  end
  #compute scores by frame
  # 5) Print scoreboard
  scoreboard = Scoreboard.new(@frames, @scores)
  scoreboard.run # this should be the last line
