require 'spec_helper'
require 'hash_table'

describe HashTable do
  before do
    @hash = HashTable.new 5
  end

  it "sets key/value pairs" do
    @hash.set('apple', 'elppa')
    @hash.table[0].head.value.must_equal 'elppa'
    @hash.set('orange', 'egnaro')
    @hash.table[1].head.value.must_equal 'egnaro'
  end

  it "inserts a colliding node at the bucket's head" do
    @hash.set('orange', 'egnaro')
    @hash.set('kiwi', 'iwik')
    @hash.table[1].head.value.must_equal 'iwik'
    @hash.table[1].head.nxt.value.must_equal 'egnaro'
  end
end
