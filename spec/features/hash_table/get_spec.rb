require 'spec_helper'
require 'hash_table'

describe HashTable do
    before do
    @hash = HashTable.new 5
    end

    it "gets a value given a key" do
      @hash.set('apple', 'elppa')
      @hash.get('apple').must_equal 'elppa'
    end

    it "returns nil if given key not present" do
      @hash.get('tomato').must_equal nil
    end
end
