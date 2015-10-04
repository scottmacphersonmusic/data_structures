require 'spec_helper'
require 'stack'
require 'benchmark'

space = "\n\n"
puts space

puts "Stack:"
puts "t = 500_000"

t = 500_000
stack = Stack.new "layer"
stack_2 = Stack.new "layer"
t.times { stack_2.push "layer" }
Benchmark.bm(15) do |x|
  x.report("t pushes:") { t.times { stack.push "layer" } }
  x.report("t pops:") { t.times { stack_2.pop } }
end

puts space
