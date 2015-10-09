HashNode = Struct.new(:key, :value, :nxt)

class Bucket
  attr_accessor :head

  def initialize
    @head = nil
  end

  def insert(key, value)
    if @head
      temp = @head
      @head = HashNode.new(key, value, temp)
    else
      @head = HashNode.new(key, value)
    end
  end

  def search(key)
    return nil if @head.nil?
    current = @head
    while current.key != key
      current = current.nxt
      return nil if current.nxt.nil?
    end
    current.value
  end

  def remove(key)
    current = @head

    @head = current.nxt and return current.value if current.key == key

    if current.nxt.key == key
      found = current.nxt
      current.nxt = current.nxt.nxt
      return found.value
    else
      current = current.nxt
    end until current.nxt.nil?
  end
end
