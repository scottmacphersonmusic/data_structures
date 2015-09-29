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

  def remove(val)
    current = @head
    if current.value == val
      @head = current.next_node
      return current
    end
    while current.value != val
      if current.next_node.value == val && current.next_node.next_node != nil
        removed = current.next_node
        current.next_node = current.next_node.next_node
        return removed
      elsif current.next_node.value == val && current.next_node.next_node.nil?
        removed = current.next_node
        current.next_node = nil
        return removed
      end
      current = current.next_node
      return nil if current.next_node.nil?
    end
  end
end
