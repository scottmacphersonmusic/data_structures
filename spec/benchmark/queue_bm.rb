require 'spec_helper'
require 'scoqueue'
require 'benchmark'

space = "\n\n"
puts space

puts "ScoQueue:"
puts "t = 5_000#{space}"

t = 5_000
q = ScoQueue.new "q"
q_2 = ScoQueue.new "q"
t.times { q_2.enqueue "q" }
Benchmark.bm(15) do |x|
  x.report("t enqueues:") { t.times { q.enqueue "q" } }
  x.report("t dequeues:") { t.times { q_2.dequeue } }
end

puts space
