# Bowling challenge
# Applicant: Roberto Ruiz, artificemm@gmail.com

  require_relative 'parser'
  require_relative 'roll'
# 1) Open file from arguments

  filename, *following_args = ARGV
  if filename.nil?
    puts "Error. You must provide a txt file with the bowling data."
    raise Errno::ENOENT
  else
    parser = Parser.new(filename)
    @data = parser.run
  end

  # debug
  puts @data

# 2) Parse file into numeric values

# 3) Set Frames with 2 rolls each. From frame 1 up to 9

# 4) Frame 10 is a special case with up to 3 rolls, depends on either strike or spare rolls

# 5) Print scoreboard