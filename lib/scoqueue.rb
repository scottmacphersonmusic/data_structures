require 'node'

class ScoQueue
  attr_accessor :head, :tail

  def initialize(value)
    @head = Node.new value
    @tail = @head
  end

  def enqueue(value)
    temp = Node.new value, @head
    @head = temp
  end

  def dequeue
    last = @tail
    current = @head
    while (current.nxt != nil) && (current.nxt != @tail)
      puts current.inspect
      current = current.nxt
    end
    @tail = current
    return last
  end
end
