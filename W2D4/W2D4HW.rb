CONSTANT = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def n_squared
  longest_word = ''
  CONSTANT.each do |fish|
    CONSTANT.each do |fish2|
    longest_word = fish if fish.length > fish2.length
    end
  end
  longest_word
end


def n_log
  i = 0

  while i < CONSTANT.length - 1
    if CONSTANT[i].length > CONSTANT[i+1].length
      CONSTANT[i], CONSTANT[i+1] = CONSTANT[i+1], CONSTANT[i]
      i = 0
    else
      i+=1
    end
  end
  CONSTANT[-1]
end
p n_squared
p n_log

def n_n
  longest_word = ''
  CONSTANT.each do |word|
    if word.length > longest_word.length
      longest_word = word
    end
  end
  longest_word
end

p n_n
TILES_ARRAY = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(direction, array)
  array.each_with_index do |move, idx|
    if move == direction
      return idx
    end
  end
end

def fix(array)
my_hash=Hash.new

i = 0
array.each do |move|
  my_hash[move] = i
  i+=1
end
my_hash
end

p slow_dance('up', TILES_ARRAY)

# HASH = { 0 => 'up', 1 => 'right-up', 2 => 'right', 3 =. 'right-down'}
def fast_dance(direction)
hash = fix(TILES_ARRAY)

return hash[direction]

end

p fast_dance('right-down')
