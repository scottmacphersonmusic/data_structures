require 'spec_helper'
require 'scoqueue'

describe ScoQueue do
  it "can dequeue tasks" do
    q = ScoQueue.new "one"
    q.enqueue "two"
    q.enqueue "three"
    # @head =  [val: three, nxt: [val: two, nxt: [val: one, nxt: nil]]]
    de_q = q.dequeue
    # @head = [val: two, nxt: [val: one, nxt: nil]]
    de_q.must_equal "one"
    q.head.val.must_equal "three"
    q.head.nxt.val.must_equal "two"

    de_q = q.dequeue
    # @head = [val: one, nxt: nil]
    de_q.must_equal "two"
    q.head.val.must_equal "three"
    q.head.nxt.must_equal nil
  end

  it "raises exception on empty queue dequeue" do
    q = ScoQueue.new "one"
    # @head = [val: one, nxt: nil]
    q.dequeue
    # @head = nil
    proc { q.dequeue }.must_raise NoMethodError
  end
end
