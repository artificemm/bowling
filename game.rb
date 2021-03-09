# Bowling challenge
# Applicant: Roberto Ruiz, artificemm@gmail.com
  REGULAR_FRAMES = 9
  LAST_FRAME = 10
  require_relative 'frame'
  require_relative 'parser'
  require_relative 'roll'
  require_relative 'scoreboard'

  # 1) Open file from arguments
  filename, *following_args = ARGV
  if filename.nil?
    puts "Error. You must provide a txt file with the bowling data."
    raise Errno::ENOENT
  else
    # 2) Parse file into numerics
    parser = Parser.new(filename)
    @data = parser.run
  end

  # 3) Set Frames with 2 rolls each. From frame 1 up to 9
  # 4) Frame 10 is a special case with up to 3 rolls, depends on either strike or spare rolls
  @players = @data.keys
  @frames = Hash.new
  @scores = Hash.new

  # Initialize frames hash
  @players.each do |player|
    @frames[player] = []
  end

  # build frames by roll
  # ["X", "7", "/", 9, 0, "X", 0, 8, 8, "/", "F", 6, "X", "X", "X", 8, 1]
  @data.each do |player, rolls|
    @current_frame = 0
    @foo = rolls
    while !@foo.empty? && @current_frame <= 10
      a, b = @foo.shift(2)
      f = Frame.new(a.to_i,b.to_i)
      if f.strike?
        @foo.unshift(b)
        if @current_frame != 10
          @frames[player].push('', "X")
        else
          @frames[player].push("X")
        end
      elsif f.spare?
        @frames[player].push(a.to_i, "/")
      else
        @frames[player].push(a.to_i, b.to_i)
      end
      @current_frame += 1
      # puts @foo
    end
  end
  #compute scores by frame
  # @scores.push(something)

  # 5) Print scoreboard
  scoreboard = Scoreboard.new(@frames, @scores)
  scoreboard.run # this should be the last line

  # debug
  # puts @players
  # puts @data
  # puts @scores




