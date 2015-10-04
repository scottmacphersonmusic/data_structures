require 'spec_helper'
require 'merge_sort'
require 'benchmark'

space = "\n\n"
puts space

puts "Merge Sort:"
puts "5_000 elements#{space}"

l = 5_000
increasing = (1..l).to_a
decreasing = (1..l).to_a.reverse
random = (1..l).to_a.shuffle
Benchmark.bm(15) do |x|
  x.report("increasing:") { increasing.merge_sort }
  x.report("decreasing:") { decreasing.merge_sort }
  x.report("random:") { random.merge_sort }
end

puts space
