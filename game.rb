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
    puts @rolls.inspect if @current_frame.zero?
    while @rolls.size > 0 && @current_frame < 10
      a, b = @rolls.shift(2)
      frame = Frame.new(a,b)
      case
        when frame.strike?
          @rolls.unshift(b)
          current_player_frame(player, '', 'X')
          current_player_score(player, frame.total + @rolls[0].to_i + @rolls[1].to_i)
        when frame.spare?
          current_player_frame(player, a, '/')
          current_player_score(player, frame.total + @rolls[0].to_i)
        when frame.open?
          a, b = a.to_i, b.to_i
          current_player_frame(player, a, b)
          current_player_score(player, frame.total)
      end
      puts "At frame: #{@current_frame}, rolls are: #{@rolls.inspect}"
      @scores[player][@current_frame] += @scores[player][@current_frame - 1] unless @current_frame.zero?
      if @current_frame == 9
        puts a
        puts b
        puts @rolls.inspect
      #   case @rolls.size
      #   when 2
          
      #   end
      # else
        
      end
      @current_frame += 1
    end
  end
  #compute scores by frame
  # 5) Print scoreboard
  scoreboard = Scoreboard.new(@frames, @scores)
  scoreboard.run # this should be the last line
