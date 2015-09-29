require 'spec_helper'
require 'linked_list'

describe LinkedList do
  it "has @head" do
    list = LinkedList.new "value"
    list.head.must_be_instance_of Node
    list.head.value.must_equal "value"
    list.head.next_node.must_equal nil
  end
end
