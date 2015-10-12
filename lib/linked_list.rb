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

    @head = current.nxt and return current if current.val == value
    if current.nxt.val == value
      found = current.nxt
      current.nxt = current.nxt.nxt
      return found
    else
      current = current.nxt
    end until current.nxt.nil?
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
