require 'node'

class Stack
  attr_accessor :head

  def initialize(val)
    @head = Node.new(val)
  end

  def push(val)
    temp = @head
    @head = Node.new(val, temp)
  end

  def pop
    raise NoMethodError, "This stack is empty!" if @head.nil?
    temp = @head
    @head = temp.next_node
    return temp
  end
end
