require 'spec_helper'
require 'hash_table'
require 'benchmark'

space = "\n\n"
puts space

puts "Hash Table:"
puts "235886 words"

puts space

words = File.read('/usr/share/dict/web2').split "\n"
ord = words.map { |word| word.chars.reduce(0) { |a, e| a + e.ord } }
avg = ord.reduce { |a, e| a + e }.to_f / words.length
puts "Average word character ordinal number sum: #{avg}"

puts space

size = avg.floor
hash = HashTable.new size
Benchmark.bm(15) do |x|
  x.report("set words:") { words.each { |word| hash.set word, word.reverse } }
  x.report("delete words:") { words.each { |word| hash.delete word } }
  puts "\n-- Hash table has #{size} slots"
end

puts space
