require 'byebug'
class Array

  # Monkey patch the Array class and add a my_inject method. If my_inject receives
  # no argument, then use the first element of the array as the default accumulator.

  def my_inject(accumulator = nil, &prc)
    prc ||= Proc.new { |x, y| x <=> y }

    i = 0
    if accumulator.nil?
      accumulator = self.first
      i = 1
    end

    self[i..-1].each do |el|
      accumulator = prc.call(accumulator, el)
    end

    accumulator
  end
end

# primes(num) returns an array of the first "num" primes.
# You may wish to use an is_prime? helper method.

def primes(num)
  count_primes = 0
  increment_numbers = 2
  result = []
  until count_primes == num
    if is_prime?(increment_numbers)
      count_primes +=1
      result << increment_numbers
      increment_numbers += 1
    else
    increment_numbers +=1
    end
  end
  result
end

def is_prime?(num)
  (2...num).each do |factor|
    return false if num % factor == 0
  end
  true
end

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
  return [1] if num <= 1
  arg = factorials_rec(num - 1)
  arg << (num-1) * arg[-1]
end

class Array

  # Write an Array#dups method that will return a hash containing the indices of all
  # duplicate elements. The keys are the duplicate elements; the values are
  # arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    hash = Hash.new { |h, k| h[k] = [] }

    self.each_with_index { |e, i| hash[e] << i }

    hash.select { |_, v| v.length > 1 }
  end
end

class String

  # Write a String#symmetric_substrings method that returns an array of substrings
  # that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def symmetric_substrings
    result = []
    self.each_char.with_index do |_char, idx1|
      idx2 = idx1 + 1
      while idx2 < self.length
          chart = self[idx1..idx2]
        if chart.length > 1
          if chart == chart.reverse
            result << chart
          end
        end
        idx2 +=1
      end
    end
    result
  end
end

class Array

  # Write an Array#merge_sort method; it should not modify the original array.

  def merge_sort(&prc)
    prc ||= Proc.new { |x, y| x <=> y }

    return self if self.length <= 1

    mid = self.length / 2

    left = self[0...mid].merge_sort(&prc)
    right = self[mid..-1].merge_sort(&prc)

    Array.merge(left, right, &prc)
  end

  private
  def self.merge(left, right, &prc)
    i, j = 0, 0
    new_arr = []
    while i < left.length && j < right.length
      if prc.call(left[i], right[j]) == -1
        new_arr << left[i]
        i += 1
      else
        new_arr << right[j]
        j += 1
      end
    end

    new_arr.concat(left[i..-1] + right[j..-1])
    new_arr
  end
end
