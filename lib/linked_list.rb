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

    # if current.value == val
    #   @head = current.next_node
    #   return current
    # end

    @head = current.nxt and return current if current.val == value

    if current.nxt.val == value
      found = current.nxt
      current.nxt = current.nxt.nxt
      return found
    else
      current = current.nxt
    end until current.nxt.nil?

    # if current.next_node.value == val
    #   found = current.next_node
    #   current.next_node = current.next_node.next_node
    #   return found
    # end while current = current.next_node

    # while current.value != val
    #   return nil if current.next_node.nil?
    #   if current.next_node.value == val && !current.next_node.next_node.nil?
    #     removed = current.next_node
    #     current.next_node = current.next_node.next_node
    #     return removed
    #   elsif current.next_node.value == val && current.next_node.next_node.nil?
    #     removed = current.next_node
    #     current.next_node = nil
    #     return removed
    #   end
    #   current = current.next_node
    # end
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
