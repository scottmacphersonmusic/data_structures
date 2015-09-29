require 'spec_helper'
require 'linked_list'

describe LinkedList do
  before do
    # Given a linked list with several nodes
    @list = LinkedList.new 7
    temp = @list.head
    @list.head = Node.new(4, Node.new(5, Node.new(6, temp)))
  end

  it "returns correct Node when search value is present" do
    # When I search for a value that is present
    node = @list.search 6
    # Then it returns the correct node object
    node.value.must_equal 6
    node.next_node.must_be_instance_of Node
  end

  it "return nil when search value isn't present" do
    # When I search for a value that isn't present
    # Then it returns nil
    @list.search(9).must_equal nil
  end
end
