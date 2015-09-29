require 'spec_helper'
require 'linked_list'

describe LinkedList do
  before do
    # Given a linked list with several nodes
    @list = LinkedList.new 7
    temp = @list.head
    @list.head = Node.new(4, Node.new(5, Node.new(6, temp)))
  end

  it "to_s prints all values in comma-separated list" do
    proc { @list.to_s }.must_output "4, 5, 6, 7\n"
  end
end
