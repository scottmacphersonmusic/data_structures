require 'spec_helper'
require 'linked_list'

describe LinkedList do
  it "has insert method" do
    list = LinkedList.new 7
    list.insert Node.new 6
    list.head.value.must_equal 6
    list.head.next_node.value.must_equal 7
  end
end
