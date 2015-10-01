require 'spec_helper'
require 'stack'

describe Stack do
  before do
    @stack = Stack.new 7
  end

  it "pushes" do
    @stack.push 6
    @stack.head.value.must_equal 6
    @stack.head.next_node.value.must_equal 7
  end

  it "pops" do
    @stack.push(6)
    pop = @stack.pop
    pop.value.must_equal 6
    @stack.head.value.must_equal 7
  end
end
