require 'spec_helper'
require 'insertion_sort'

describe 'Insertion Sort' do
  it "sorts an array of numbers" do
    a = (1..10).to_a.shuffle
    a.insertion_sort.must_equal (1..10).to_a
  end

  it "returns array if length == 1" do
    [7].insertion_sort.must_equal [7]
  end
end
