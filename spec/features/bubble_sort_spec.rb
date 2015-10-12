require 'spec_helper'
require 'bubble_sort'

describe "Bubble Sort" do
  it "sorts an array of numbers" do
    a = (1..10).to_a.shuffle
    a.bubble_sort!.must_equal((1..10).to_a)
  end

  it "returns array if length == 1" do
    [7].bubble_sort!.must_equal [7]
  end
end
