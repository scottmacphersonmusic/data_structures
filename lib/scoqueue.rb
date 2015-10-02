require 'task'

class ScoQueue
  attr_accessor :head, :tail

  def initialize(val)
    @head = Task.new val
    @tail = @head
  end

  def enqueue(val)
    temp = Task.new(val, @head)
    @head = temp
  end
end
