require 'node'

class LinkedList
  attr_accessor :head

  def initialize(value)
    @head = Node.new value
  end
  end
end
