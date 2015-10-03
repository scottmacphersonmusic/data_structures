require 'spec_helper'
require 'linked_list'

describe LinkedList do
  before do
    # Given a linked list with several nodes
    @list = LinkedList.new 7
    temp = @list.head
    @list.head = Node.new(4, Node.new(5, Node.new(6, temp)))
  end

  it "returns correct Node when removed" do
    # When I remove a value that is present
    node = @list.remove 5
    # Then it returns the correct node object
    node.val.must_equal 5
    # And the it is no longer in the list
    @list.head.nxt.val.must_equal 6
  end

  it "returns correct Node if its the first one" do
    node = @list.remove 4
    node.val.must_equal 4
    @list.head.val.must_equal 5
  end

  it "returns correct Node if its the last one" do
    node = @list.remove 7
    node.val.must_equal 7
    @list.head.nxt.nxt.val.must_equal 6
    @list.head.nxt.nxt.nxt.must_equal nil
  end

  it "returns nil if Node to be removed isn't found" do
    # When I try to remove a value that isn't present
    # Then it returns nil
    @list.remove(3).must_equal nil
  end
end
