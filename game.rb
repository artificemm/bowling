# Bowling challenge
# Applicant: Roberto Ruiz, artificemm@gmail.com
  REGULAR_FRAMES = 9
  LAST_FRAME = 10
  require_relative 'parser'
  require_relative 'roll'

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


  # 5) Print scoreboard

  # debug
  puts @players
  puts @data




