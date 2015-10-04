require 'spec_helper'
require 'merge_sort'

describe 'Merge Sort' do
  it "depends on #merge" do
    [3].merge([2]).must_equal [2, 3]
    [3, 4, 5].merge([1, 2, 6]).must_equal [1, 2, 3, 4, 5, 6]
  end

  it "sorts an array of numbers" do
    a = (1..10).to_a.shuffle
    a.merge_sort.must_equal (1..10).to_a
  end

  it "returns array if length == 1" do
    [7].merge_sort.must_equal [7]
  end
end
