if index

if current_roll.strike?
  callrecursive(current_roll + 1, current_roll + 2)
elsif current_roll.spare?
  callrecursive(current_roll, current_roll + 1)
else
  (current_roll, next_frame).sum
