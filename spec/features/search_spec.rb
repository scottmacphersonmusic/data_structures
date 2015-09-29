require 'spec_helper'
require 'linked_list'

describe LinkedList do
  it "has search method" do
    # Given a linked list with several nodes
    list = LinkedList.new 7
    temp = list.head
    list.head = Node.new(4, Node.new(5, Node.new(6, temp)))
    # When I search for a given value
    node = list.search 6
    # It returns the correct node object
    node.value.must_equal 6
    node.next_node.must_be_instance_of Node
  end
end
