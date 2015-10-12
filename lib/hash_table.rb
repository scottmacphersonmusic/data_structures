require 'bucket'

class HashTable
  attr_accessor :size, :table

  def initialize(size)
    @size = size
    @table = set_buckets
  end

  def hash(key)
    key.chars.reduce(0) { |a, e| a + e.ord } % @size
  end

  def set(key, value)
    fail TypeError, "key must be a String" if key.class != String
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
    table.map { Bucket.new }
  end
end
