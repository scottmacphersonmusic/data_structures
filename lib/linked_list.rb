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

    @head = current.next_node and return current if current.value == val

    if current.next_node.value == val
      found = current.next_node
      current.next_node = current.next_node.next_node
      return found
    else
      current = current.next_node
    end until current.next_node.nil?
  end

  def to_s
    current = @head
    list = "#{current.value}"
    until current.next_node.nil?
      list += ", #{current.next_node.value}"
      current = current.next_node
    end
    puts list
  end
end
