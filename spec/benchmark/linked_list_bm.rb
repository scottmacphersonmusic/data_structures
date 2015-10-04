require 'spec_helper'
require 'linked_list'
require 'benchmark'

space = "\n\n"
puts space

puts "Linked List:"
puts "t = 50_000"

t = 50_000
list = LinkedList.new "node"
list_2 = LinkedList.new 1
(2..t).to_a.map { |num| list.insert Node.new num }
Benchmark.bm(15) do |x|
  x.report("t insertions:") { t.times { list.insert Node.new "node" } }
  x.report("t removalals:") do
    (1..t).to_a.reverse.map { |num| list_2.remove num }
  end
end

puts space
