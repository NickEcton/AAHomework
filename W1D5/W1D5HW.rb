class Stack
  def initialize(stack)
    @stack = stack
  end

  def push(el)
    @stack << el
  end

  def pop
    @stack.pop
  end

  def peek
    return @stack[0]
  end
end

# prac = Stack.new([])
# p prac.push(6)
# p prac.push(12)
# p prac.peek
# p prac.pop
# p prac

class Queue
  def initialize(queue)
    @queue = queue
  end

  def enqueue(el)
    @queue << el
  end

  def dequeue
    @queue.shift
  end

  def peek
    @queue[0]
  end
end

# prac = Queue.new([])
# p prac.enqueue(6)
# p prac.enqueue(12)
# p prac.peek
# p prac.dequeue
# p prac

class Map
  def initialize(map)
    @map = map
  end

  def set(k, v)
    @map.each do |arr|
      if k == arr[0]
        arr[1] = v
        return @map
      end
    end
    @map << [k,v]
  end

  def get(k)
    @map.each do |arr|
      if k == arr[0]
        return arr
      end
    end
  end

  def delete(k)
    @map.each do |arr|
      if k == arr[0]
        @map.delete(arr)
      end
    end
  end

  def show
    @map
  end
end
# prac = Map.new([])
# prac.set('a','alphabet')
# prac.set('b','butterfly')
# p prac.show
# prac.set('a','accident')
# p prac.show
# prac.delete('b')
# p prac.show
# p prac.get('a')
