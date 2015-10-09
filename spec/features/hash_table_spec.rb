require 'spec_helper'
require 'hash_table'

# Bucket (Node has val, add key)
# alias ['']= to set?
describe HashTable do
  before do
    @hash = HashTable.new 5
    @keys = ['apple', 'orange', 'banana', 'kiwi', 'peach']
  end

  it "can hash a key" do
    @keys.each do |key|
      @hash.hash(key).must_be_close_to 2, 2
    end
  end

  it "sets key/value pairs" do
    @hash.set('apple', 'elppa')
    @hash.table[0].head.value.must_equal 'elppa'
  end

  it "inserts a colliding node at the bucket's head" do
    @hash.set('orange', 'egnaro')
    @hash.set('kiwi', 'iwik')
    @hash.table[1].head.value.must_equal 'iwik'
    @hash.table[1].head.nxt.value.must_equal 'egnaro'
  end

  it "gets a value given a key" do
    @hash.set('apple', 'elppa')
    @hash.get('apple').must_equal 'elppa'
  end

  it "returns nil if given key not present" do
    @hash.get('tomato').must_equal nil
  end

  it "removes a key/value pair" do
    @keys.each do |key|
      @hash.set(key, key.reverse)
    end
    @hash.delete('kiwi').must_equal 'iwik'
    @hash.table[1].head.key.must_equal 'orange'
  end
end
