require 'spec_helper'
require 'hash_table'

describe HashTable do
  before do
    @hash = HashTable.new 5
  end

  it "sets key/value pairs" do
    @hash.set 'apple', 'elppa'
    @hash.set 'orange', 'egnaro'
    @hash.table[0].head.value.must_equal 'elppa'
    @hash.table[1].head.value.must_equal 'egnaro'
  end

  it "sets a colliding node at the bucket's head" do
    @hash.set 'orange', 'egnaro'
    @hash.set 'kiwi', 'iwik'
    @hash.table[1].head.value.must_equal 'iwik'
    @hash.table[1].head.nxt.value.must_equal 'egnaro'
  end

  it "raises an exception if key isn't a string" do
    [:symbol, 7, true].each do |type|
      proc { @hash.set type, 'value' }
        .must_raise TypeError
    end
  end
end
