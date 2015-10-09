require 'bucket'

class HashTable
  attr_accessor :size, :table

  def initialize(size)
    @size = size
    @table = set_buckets
  end

  def hash(key)
    key.chars.reduce(0) { |ord_sum, char| ord_sum + char.ord } % @size
  end

  def set(key, value)
    bucket(key).insert key, value
  end

  def get(key)
    bucket(key).search key
  end

  def delete(key)
    bucket(key).remove key
  end

  private

  def bucket(key)
    @table[hash(key)]
  end

  def set_buckets
    table = Array.new @size
    table.map { |i| i = Bucket.new }
  end
end
