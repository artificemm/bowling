# Bowling

Ten-pin bowling scoreboard program. Developed as an interview challenge for Jobsity, LLC.

## Usage

Program can be run with the following command:
    $ ruby game.rb <filename.txt>

    Where <filename.txt> should be a valid game file with the following structure:
        Player1 10
        Player2 4
        Player2 6
        Player3 0
        Player3 10

        Each line has the player name and the value of the roll separated by a tab character.

    There are some testing files provided in the `data` folder.

The program will output the scoreboard of the game with the sum for each frame, accounting for bowling rules, such as `spare` and `strike`.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/artificemm/bowling.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
