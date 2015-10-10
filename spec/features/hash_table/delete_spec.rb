require 'spec_helper'
require 'hash_table'

describe HashTable do
  before do
    @hash = HashTable.new 5
    %w(abc bca cab).each { |key| @hash.set(key, key.reverse) }
  end

  it "delete a key/value pair where bucket has 1" do
    @hash.set('apple', 'elppa')
    @hash.delete('apple').must_equal 'elppa'
    @hash.table[0].head.must_equal nil
  end

  it "delete first key/value pair where bucket has many" do
    @hash.delete('cab').must_equal 'bac'
    @hash.table[4].head.key.must_equal 'bca'
  end

  it "deletes last key/value pair where bucket has many" do
    @hash.delete('abc').must_equal 'cba'
    @hash.table[4].head.nxt.nxt.must_equal nil
  end

  it "deletes middle key/value pair where bucket has many" do
    @hash.delete('bca').must_equal 'acb'
    @hash.table[4].head.nxt.key.must_equal 'abc'
  end

  it "returns nil if key in delete(key) isn't present" do
    @hash.delete('not present').must_equal nil
    @hash.delete('cba').must_equal nil
  end
end
