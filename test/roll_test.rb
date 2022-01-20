require "test_helper"
require "minitest/spec"

describe "Roll" do
  it "creates a new roll" do
    roll = Bowling::Roll.new('0')
    refute_nil roll
  end

  it "raises an error when passing an invalid value" do
    assert_raises TypeError do
      Bowling::Roll.new('Y')
    end
  end

  it "Returns integer value from open roll" do
    roll = Bowling::Roll.new('10')
    assert(roll, 10)
  end

  it "Returns integer zero from fault roll" do
    roll = Bowling::Roll.new('F')
    assert(roll, 0)
  end
end
