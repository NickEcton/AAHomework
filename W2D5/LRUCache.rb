class LRUCache
    def initialize(num_of_elements)
      @cache = []
      @max_size = num_of_elements
    end

    def count
      @cache.count
    end

    def add(el)
      if @cache.include?(el)
        @cache.delete(el)
      end 
      if count == @max_size
        @cache.shift
      end
      @cache.push(el)
      # adds element to cache according to LRU principle
    end

    def show
      p @cache
      # shows the items in the cache, with the LRU item first
    end

    private

  end

  johnny_cache = LRUCache.new(4)

  johnny_cache.add("I walk the line")
  johnny_cache.add(5)

p  johnny_cache.count # => returns 2

  johnny_cache.add([1,2,3])
  johnny_cache.add(5)
  johnny_cache.add(-5)
  johnny_cache.add({a: 1, b: 2, c: 3})
  johnny_cache.add([1,2,3,4])
  johnny_cache.add("I walk the line")
  johnny_cache.add(:ring_of_fire)
  johnny_cache.add("I walk the line")
  johnny_cache.add({a: 1, b: 2, c: 3})

p johnny_cache.show
