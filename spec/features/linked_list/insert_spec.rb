require 'spec_helper'
require 'linked_list'

describe LinkedList do
  it "has insert method" do
    list = LinkedList.new 7
    list.insert Node.new 6
    list.head.val.must_equal 6
    list.head.nxt.val.must_equal 7
  end
end
