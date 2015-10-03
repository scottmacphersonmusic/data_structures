require 'node'

class ScoQueue
  attr_accessor :head

  def initialize(value)
    @head = Node.new value
  end

  def enqueue(value)
    temp = Node.new value, @head
    @head = temp
  end

  def dequeue
    raise NoMethodError, "This queue is empty!"if @head.nil?
    if @head.nxt.nil?
      temp = @head
      @head = nil
      return temp
    end
    current = @head
    while current.nxt != nil
      if current.nxt.nxt == nil
        temp = current.nxt
        current.nxt = nil
        return temp
      end
      current = current.nxt
    end
  end
end
