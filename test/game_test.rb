require "test_helper"
require "minitest/spec"

describe "Bowling" do
  # it "returns a version" do
  #   refute_nil ::Bowling::VERSION
  # end

  it "creates a new bowling game" do
    game = Game.new('data/example.txt')
    refute_nil game
  end
end
