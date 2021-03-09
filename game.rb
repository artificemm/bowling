# Bowling challenge
# Applicant: Roberto Ruiz, artificemm@gmail.com

  require_relative 'frame'
  require_relative 'parser'
  require_relative 'roll'
  require_relative 'scoreboard'
  require 'pry'

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
  @players = @data.keys
  @frames = Hash.new
  @scores = Hash.new
  @computed_scores = Hash.new

  # Initialize frames hash
  @players.each do |player|
    @frames[player] = []
    @scores[player] = []
    @computed_scores[player] = []
  end

  # build frames by roll
  @data.each do |player, rolls|
    @current_frame = 0
    @foo = rolls.map(&:to_i)
    while !@foo.empty? && @current_frame <= 9
      # binding.pry
      a, b = @foo.shift(2)
      f = Frame.new(a,b)
      if f.strike?
        @foo.unshift(b)
        if @current_frame < 8
          @frames[player].push('', "X")
          @scores[player].push([10+@foo[0]+@foo[1]])
        else
          @frames[player].push("X")
          @scores[player].push([10+@foo[0].to_i+@foo[1].to_i])
        end
      elsif f.spare?
        @frames[player].push(a, "/")
        @scores[player].push([10+@foo[0]])
      else
        a, b = a.to_i, b.to_i
        @frames[player].push(a, b)
        @scores[player].push(a + b)
      end
      @current_frame += 1
    end
      @computed_scores[player].push(@scores[player].flatten!).reduce(:+)
  end

  # 5) Print scoreboard
  scoreboard = Scoreboard.new(@frames, @computed_scores)
  scoreboard.run # this should be the last line
