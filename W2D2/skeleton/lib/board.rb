require_relative "player"
class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { [] }
    place_stones
  end

  def place_stones
    (0..13).each do |i|
      unless i == 6 || i == 13
        @cups[i] += [:stone, :stone, :stone, :stone]
      end
    end
  end

  def valid_move?(start_pos)
    raise 'Invalid starting cup' if start_pos > 13 || start_pos < 0
    raise 'Starting cup is empty' if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)

      (1..@cups[start_pos].length).each do |i|

        new_position = ((start_pos + i) % 14)




        if new_position == 13
          @cups[new_position] += [:stone] if current_player_name = @name2
        else
            @cups[new_position] += [:stone]
        end
      elsif current_player_name == @name1
        if new_position
          new_position -=7
        end
      end

        @cups[new_position] += [:stone]
      end
      @cups[start_pos] = []
      render

      new_position = (@cups[start_pos].length + start_pos)

      if new_position > 13
        new_position -= 13
      end

      next_turn(new_position)
  end

  def next_turn(ending_cup_idx)
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].length == 1
      :switch
    else
     ending_cup_idx
    end
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    return true if (0...6).all? { |el| @cup[el].empty?}
    return true if (7...13).all? { |el| @cup[el].empty?}
  end

  def winner
  end
end
