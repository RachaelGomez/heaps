class HeapNode
  attr_reader :key, :value

  def initialize(key, value)
    @key = key
    @value = value
  end
end

class MinHeap

  def initialize
    @store = []
  end

  # This method adds a HeapNode instance to the heap
  # Time Complexity: ?
  # Space Complexity: ?
  def add(key, value = key)
    @store << HeapNode.new(key, value) 

    heap_up((@store.length - 1))
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: ?
  # Space Complexity: ?
  def remove()
    return nil if @store.empty?

    swap(0, @store.length - 1)
    removed = @store.pop

    heap_down(0) unless @store.empty?

    removed.value
  end


  # Used for Testing
  def to_s
    return "[]" if @store.empty?

    output = "["
    (@store.length - 1).times do |index|
      output += @store[index].value + ", "
    end

    output += @store.last.value + "]"
      
    return output
  end

  # This method returns true if the heap is empty
  # Time complexity: ?
  # Space complexity: ?
  def empty?
    @store.empty?
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: ?
  # Space complexity: ?
  def heap_up(index)
    if index == 0
      return
    end

    head = (index - 1 ) / 2

    if index == 0
      return
    elsif @store[index].key < @store[head].key
      swap(head,index)
      heap_up(head)
    end

  end

  # This helper method takes an index and 
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(index)
    left = (index * 2) + 1
    right = (index * 2) + 2
    if left >= @store.length - 1
      return
    end
    if @store[right] && @store[right].key < @store[left].key && @store[right].key < @store[index].key
      swap(right, index)
      heap_down(right)
    elsif @store[left].key < @store[index].key
      swap(left, index)
      heap_down(left)
    end
  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end