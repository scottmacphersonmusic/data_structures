require 'node'

class SinglyLinkedList
  attr_accessor :head

  def initialize(value)
    @head = Node.new(value, nil)
  end
end
