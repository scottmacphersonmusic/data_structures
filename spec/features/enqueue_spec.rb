require 'spec_helper'
require 'scoqueue'

describe ScoQueue do
  it "can enqueue task" do
    q = ScoQueue.new "First Task"

    q.head.val.must_equal "First Task"
    q.head.nxt.must_equal nil
    q.tail.val.must_equal "First Task"

    q.enqueue "Second Task"
    q.enqueue "Third Task"

    q.head.val.must_equal "Third Task"
    q.head.nxt.val.must_equal "Second Task"
    q.tail.val.must_equal "First Task"
    q.tail.nxt.must_equal nil
  end
end
