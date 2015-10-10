require 'spec_helper'
require 'hash_table'

describe HashTable do
  it "can hash a key" do
    @hash = HashTable.new 5
    keys = %w(apple orange banana kiwi peach)
    keys.each { |key| @hash.hash(key).must_be_close_to 2, 2 }
  end
end
