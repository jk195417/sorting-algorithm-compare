require_relative './min_heap'

class RandomInt
  attr_accessor :array
  attr_reader :number

  def initialize(number: 10, range: 100)
    prng = Random.new
    @array = 1.upto(number).map { prng.rand(range) }
    @number = number
  end

  def bubble_sort
    result = Array.new(@array)
    loop do
      swapped = false
      (result.length - 1).times do |i|
        next unless result[i] > result[i + 1]
        result[i], result[i + 1] = result[i + 1], result[i] # Swap
        swapped = true
      end
      break unless swapped
    end
    result
  end

  def selection_sort
    result = Array.new(@array)
    0.upto(result.length - 1) do |i|
      min = i
      (i + 1).upto(result.length - 1) do |j|
        min = j if result[j] < result[min]
      end
      result[i], result[min] = result[min], result[i] # Swap
    end
    result
  end

  def insertion_sort
    result = Array.new(@array)
    return result if result.length < 2
    (1..result.length - 1).each do |i|
      value = result[i]
      j = i - 1
      while (j >= 0) && result[j] > value
        result[j + 1] = result[j]
        j -= 1
      end
      result[j + 1] = value
    end
    result
  end

  def quick_sort
    result = Array.new(@array)
    bottom = []
    top = []
    top[0] = 0
    bottom[0] = result.length
    i = 0
    while i >= 0
      l = top[i]
      r = bottom[i] - 1
      if l < r
        pivot = result[l]
        while l < r
          r -= 1 while result[r] >= pivot && l < r
          if l < r
            result[l] = result[r]
            l += 1
          end
          l += 1 while result[l] <= pivot && l < r
          if l < r
            result[r] = result[l]
            r -= 1
          end
        end
        result[l] = pivot
        top[i + 1] = l + 1
        bottom[i + 1] = bottom[i]
        bottom[i] = l
        i += 1
      else
        i -= 1
      end
    end
    result
  end

  def heap_sort
    result = []
    heap = MinHeap.new(Array.new(@array))
    result << heap.pop until heap.empty?
    result
  end
end
