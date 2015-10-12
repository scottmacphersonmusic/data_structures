require 'node'

class LinkedList
  attr_accessor :head

  def initialize(value)
    @head = Node.new value
  end

  def insert(node)
    node.nxt = @head
    @head = node
  end

  def search(value)
    current = @head
    while current.val != value
      current = current.nxt
      return nil if current.nxt.nil?
    end
    current
  end

  def remove(value)
    current = @head

    @head = current.next_node and return current if current.value == val

    if current.nxt.val == value
      found = current.nxt
      current.nxt = current.nxt.nxt
      return found
    else
      current = current.next_node
    end until current.next_node.nil?
  end

  def to_s
    current = @head
    list = "#{current.val}"
    until current.nxt.nil?
      list += ", #{current.nxt.val}"
      current = current.nxt
    end
    puts list
  end
end
