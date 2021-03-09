# Bowling challenge
# Applicant: Roberto Ruiz, artificemm@gmail.com

# 1) Open file from arguments

first_arg, *following_args = ARGV
if first_arg.nil?
  puts "Error. You must provide a txt filename with the bowling data."
  raise Errno::ENOENT
else
  @data = Parser.get_data_from_file(first_arg)
end


# 2) Parse file into numeric values

# 3) Set Frames with 2 rolls each. From frame 1 up to 9

# 4) Frame 10 is a special case with up to 3 rolls, depends on either strike or spare rolls

# 5) Print scoreboard