require "test_helper"
require "minitest/spec"

describe "Frame" do
  it "creates a new frame" do
    frame = Bowling::Frame.new
    refute_nil frame
  end

  it "returns strike if first roll is 10" do
    frame = Bowling::Frame.new(fr: 10, sr: 0)
    assert frame.strike?
  end

  it "returns spare if second roll is 10" do
    frame = Bowling::Frame.new(fr: 0, sr: 10)
    assert frame.spare?
  end

  it "returns spare when both rolls sum 10" do
    frame = Bowling::Frame.new(fr: 5, sr: 5)
    assert frame.spare?
  end

  it "returns open if rolls are lower than 10" do
    frame = Bowling::Frame.new(fr: 3, sr: 6)
    assert frame.open?
  end
end
