require 'spec_helper'
require 'singly_linked_list'

describe SinglyLinkedList do
  it "has @head" do
    list = SinglyLinkedList.new "value"
    list.head.must_be_instance_of Node
    list.head.value.must_equal "value"
    list.head.next_node.must_equal nil
  end


end
