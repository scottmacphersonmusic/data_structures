require 'spec_helper'
require 'scoqueue'

describe ScoQueue do
  before do
    @q = ScoQueue.new "Homework"
  end

  it "returns size" do
    @q.size.must_equal 1
    @q.enqueue "Buy Groceries"
    @q.size.must_equal 2
  end

  it "returns zero for size if queue is empty" do
    @q.dequeue
    @q.size.must_equal 0
  end
end
