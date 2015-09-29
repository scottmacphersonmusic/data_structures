require 'node'

class LinkedList
  attr_accessor :head

  def initialize(value)
    @head = Node.new value
  end

  def insert(node)
    node.next_node = @head
    @head = node
  end

  def search(val)
    current = @head
    while current.value != val
      current = current.next_node
      return nil if current.next_node.nil?
    end
    current
  end
end
