require 'spec_helper'
require 'scoqueue'

describe ScoQueue do
  it "can enqueue task" do
    q = ScoQueue.new "First Task"
    # @head = [val: "First Task", nxt: nil]
    q.head.val.must_equal "First Task"
    q.head.nxt.must_equal nil

    q.enqueue "Second Task"
    q.enqueue "Third Task"
    # @head = [val: "Third Task", nxt:
    #          [val: "Second Task", nxt:
    #           [val: "First Task", nxt: nil]]]
    q.head.val.must_equal "Third Task"
    q.head.nxt.val.must_equal "Second Task"
    q.head.nxt.nxt.val.must_equal "First Task"
    q.head.nxt.nxt.nxt.must_equal nil
  end
end
