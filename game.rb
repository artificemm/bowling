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
    # 2) Parse file into numeric values
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
    @scores[player] = []
  end

  # build frames by roll
  # ["X", "7", "/", 9, 0, "X", 0, 8, 8, "/", "F", 6, "X", "X", "X", 8, 1]
  @data.each do |player, rolls|
    @current_frame = 0
    @foo = rolls.map(&:to_i)
    while !@foo.empty? && @current_frame <= 10
      a, b = @foo.shift(2)
      f = Frame.new(a,b)
      if f.strike?
        @foo.unshift(b)
        if @current_frame != 10
          @frames[player].push('', "X")
          @scores[player].push([10, @foo[0], @foo[1]])
        else
          @frames[player].push("X")
          @scores[player].push([10, @foo[0], @foo[1]])
        end
      elsif f.spare?
        @frames[player].push(a, "/")
        @scores[player].push([10, @foo[0]])
      else
        @frames[player].push(a, b)
          @scores[player].push([a + b])
      end
      @current_frame += 1
      puts @scores[player].to_s
      @scores[player].each { |x| x.inject(0, :+) }
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




