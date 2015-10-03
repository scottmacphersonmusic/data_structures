require 'spec_helper'
require 'insertion_sort'
require 'benchmark'

space = "\n\n"
puts space

puts "Insertion Sort:"
puts "5_000 elements#{space}"

l = 5_000
best_case = (1..l).to_a
worst_case = (1..l).to_a.reverse
random = (1..l).to_a.shuffle
Benchmark.bm(15) do |x|
  x.report("best-case:") { best_case.insertion_sort }
  x.report("worst-case:") { worst_case.insertion_sort }
  x.report("random:") { random.insertion_sort }
end

puts space
