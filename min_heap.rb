class MinHeap
  attr_accessor :array

  def initialize(ary = [])
    # heap array index start at 1
    @array = [0]
    ary.each { |a| add a }
  end

  def size
    @array.length - 1
  end

  def add(n)
    @array << n

    node = size
    parent = (node.odd? ? (node - 1) / 2 : node / 2)
    while @array[node] < @array[parent]
      @array[node], @array[parent] = @array[parent], @array[node]
      node = parent
      parent = (parent.odd? ? (parent - 1) / 2 : parent / 2)
      break if parent == 0
    end
  end

  def pop
    if empty?
      result = nil
    else
      @array[1], @array[size] = @array[size], @array[1]
      result = @array.pop
      parent = 1
      left = parent * 2
      right = left + 1
      while @array[left]
        node = if @array[right] && @array[right] < @array[left]
                 right
               else
                 left
               end
        if @array[parent] > @array[node]
          @array[parent], @array[node] = @array[node], @array[parent]
        end
        parent = node
        left = parent * 2
        right = left + 1
      end
    end
    result
  end

  def empty?
    size <= 0 ? true : false
  end
end
