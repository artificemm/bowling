class Scoreboard
  SPACER = "\t"
  DOUBLE_SPACER = "\t\t"
  TEST = {'Jeff': [ [1,2], [1,2], [1,2], [1,2], [1,2], [1,2], [1,2], [1,2], [1,2], [1,2]
                  ]}

  DATA    = { 'Jeff': ["X", "7", "/", 9, 0, "X", 0, 8, 8, "/", "F", 6, "X", "X", "X", 8, 1],
              'John': [3, "/", 6, 3, "X", 8, 1, "X", "X", 9, 0, 7, "/", 4, 4, "X", 9, 0]
            }

  PLAYERS = { 'Jeff': ["","X", "7", "/", 9, 0, "", "X", 0, 8, 8, "/", "F", 6, "", "X", "", "X", "X", 8, 1],
              'John': [3, "/", 6, 3, "", "X", 8, 1, "", "X", "", "X", 9, 0, 7, "/", 4, 4, "X", 9, 0] }

  SCORE = { 'Jeff': [20, 39, 48, 66, 74, 84, 90, 120, 148, 167],
            'John': [16, 25, 44, 53, 82, 101, 110, 124, 132, 151]
          }

  def initialize(data)
    @data = data
  end

  def run
    puts header
    @data.each do |player, rolling|
      puts player
      puts ["Pinfalls", rolling.flatten].join(SPACER)
      puts ["Score", SCORE[player]].join(DOUBLE_SPACER) # Test for format
    end
    return true # don't return objects
  end

  def header
    ["Frame", (1..10).to_a].join(DOUBLE_SPACER)
  end
end