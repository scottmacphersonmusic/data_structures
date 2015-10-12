require 'spec_helper'
require 'linked_list'
require 'benchmark'

space = "\n\n"
puts space

puts "Linked List:#{space}"

list = LinkedList.new "node"
t = 500_000
list_2 = LinkedList.new 1
(2..50_00).to_a.map { |num| list.insert Node.new num }
Benchmark.bm(15) do |x|
  x.report("50_000 insertions:") { t.times do ; list.insert Node.new "node" end }
  x.report("50_000 removals:") do
    (1..50_000).to_a.reverse.map { |num| ; list_2.remove num }
  end
end

puts space
