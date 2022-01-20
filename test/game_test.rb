require "test_helper"
require "minitest/spec"

describe "Bowling" do
  it "creates a new bowling game" do
    game = Bowling::Game.new('data/example.txt')
    refute_nil game
  end

  it "compares exit from succesful parsing" do
    expectation = "Frame		1		2		3		4		5		6		7	89		10
    Jeff
    Pinfalls		X	7	/	9	0		X	0	8	8	/	0	6X		X		X
    Score		20		39		48		66		74		84		90120		148		167
    John
    Pinfalls	3	/	6	3		X	8	1		X		X	9	07	/	4	4		X
    Score		16		25		44		53		82		101		110124		132		151"

    game = Bowling::Game.new('data/example.txt')
    actual = game.play
    assert(actual, expectation)
    # This one is a WIP, since I'm implementing tests and refactoring the whole solution
  end
end
