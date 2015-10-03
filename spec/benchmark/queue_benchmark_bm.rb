require 'spec_helper'
require 'scoqueue'
require 'benchmark'

space = "\n\n"
puts space

puts "ScoQueue:#{space}"

q = ScoQueue.new "q"
t = 5_000
q_2 = ScoQueue.new "q"
t.times { q_2.enqueue "q" }
Benchmark.bm(15) do |x|
  x.report("5_000 enqueues:") { t.times do ; q.enqueue "q" end }
  x.report("5_000 dequeues:") { t.times do ; q_2.dequeue end }
end

puts space
