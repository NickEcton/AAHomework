require 'byebug'
class Array

  # Monkey patch the Array class and add a my_inject method. If my_inject receives
  # no argument, then use the first element of the array as the default accumulator.

  def my_inject(accumulator = nil, &prc)
    accumulator ||= self.shift

    self.each { |el| accumulator = prc.call(acc, el) }
  end

# primes(num) returns an array of the first "num" primes.
# You may wish to use an is_prime? helper method.

def is_prime?(num)
return false if num < 2

(2...num).none? { |num2| num % num2 == 0}
end

def primes(num)
  arr = []
  i = 0
  until arr.length == num
    arr < i if is_prime?(i)
    i+=1
  end
  arr
end

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
  return [1] if num == 1

  factorials_rec(num-1) << factorials_rec(num-1).last * (num - 1)
end

class Array

  # Write an Array#dups method that will return a hash containing the indices of all
  # duplicate elements. The keys are the duplicate elements; the values are
  # arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    result = Hash.new { |h, k| h[k] = [] }
    self.each_with_index do |el, idx|
      result[el] << idx
    end
    result.select { |_,v| v.length > 1 }
  end
end

class String

  # Write a String#symmetric_substrings method that returns an array of substrings
  # that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def symmetric_substrings
    result = []
    i = 0

    while i < self.length - 1
      j = i + 1

      while j < self.length
        curr_substring = self[i..j]
        if curr_substring == curr_substring.reverse
            result << curr_substring
        end
        j += 1
      end
      i+=1
    end
    result
  end
end

class Array

  # Write an Array#merge_sort method; it should not modify the original array.

  def merge_sort(&prc)
    return self if self.length <= 1

    prc ||= proc.new { |x,y| x <=> y }


    mid = self.length / 2

    left_side = self.take(mid).merge_sort(&prc)
    right_side = self.drop(mid).merge_sort(&prc)

    Array.merge(left_side, right_side, &prc)
  end

  private
  def self.merge(left, right, &prc)
    merged = []

    until left.empty? || right.empty?
      called = proc.call(left[0], right[0])
      if called == 1
        merged << right.shift
      else
        merged << left.shift
      end
    end
    merged + left + right
  end
end
end
