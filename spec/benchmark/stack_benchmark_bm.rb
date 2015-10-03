require 'spec_helper'
require 'stack'
require 'benchmark'

space = "\n\n"
puts space

puts "Stack:#{space}"

stack = Stack.new "layer"
t = 500_000
stack_2 = Stack.new "layer"
t.times { stack_2.push "layer" }
Benchmark.bm(15) do |x|
  x.report("500_000 pushes:") { t.times do ; stack.push "layer" end }
  x.report("500_000 pops:") { t.times do ; stack_2.pop end }
end

puts space
