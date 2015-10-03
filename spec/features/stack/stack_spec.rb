require 'spec_helper'
require 'stack'

describe Stack do
  before do
    @stack = Stack.new 7
  end

  it "pushes" do
    @stack.push 6
    @stack.head.val.must_equal 6
    @stack.head.nxt.val.must_equal 7
  end

  it "pops" do
    @stack.push(6)
    pop = @stack.pop
    pop.val.must_equal 6
    @stack.head.val.must_equal 7
  end

  it "raises an exception if stack is empty" do
    @stack.pop
    proc { @stack.pop }.must_raise NoMethodError
  end
end
