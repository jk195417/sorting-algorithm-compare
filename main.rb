require 'benchmark'
require_relative './random_int'

threads = []
cases = []

6.times do
  print 'please enter a integer : '
  n = gets.chomp!
  n = Integer(n)
  cases << RandomInt.new(number: n)
end

puts "\nstart sorting..."

cases.each do |c|
  puts "number = #{c.number}"
  Benchmark.bm(20) do |x|
    x.report('bubble_sort') { 25.times { c.bubble_sort } }
    x.report('selection_sort') { 25.times { c.selection_sort } }
    x.report('insertion_sort') { 25.times { c.insertion_sort } }
    x.report('quick_sort') { 25.times { c.quick_sort } }
    x.report('heap_sort') { 25.times { c.heap_sort } }
  end
  puts "\n" * 2
end
