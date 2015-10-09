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
    return nil if @head.nil?
    if @head.key == key && @head.nxt.nil?
      value = @head.value
      @head = nil
      return value
    elsif @head.key == key
      value = @head.value
      @head = @head.nxt
      return value
    end

    current = @head

    while current.nxt.key != key
      current = current.nxt
      return nil if current.nxt.nil?
    end

    value = current.nxt.value
    current.nxt = (current.nxt.nxt.nil? ? nil : current.nxt.nxt)
    return value
  end
end
