class Board
  attr_accessor :cups

  attr_reader :name1, :name2

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = place_stones
  end

  def place_stones
    Array.new(14).map.with_index do |cup, i|
      if i == 6 || i == 13
        []
      else
        Array.new(4) { :stone }
      end
    end
  end

  def valid_move?(start_pos)
    unless start_pos.between?(0, 5) || start_pos.between?(7, 12)
      raise InvalidStartingCup, 'Invalid starting cup'
    end
    true
  end

  def make_move(start_pos, current_player_name)
    stones = cups[start_pos]
    cups[start_pos] = []
    i = start_pos
    while true
      i += 1

      if i == 6 && current_player_name == name2
        i += 1
      elsif i == 13 && current_player_name == name1
        i += 1
      end
      i %= 14
      cups[i] << stones.pop
      break if stones.empty?
    end

    render
    next_turn(i)
  end

  def next_turn(ending_cup_idx)
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif cups[ending_cup_idx].length == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    cups[0..5].all?(&:empty?) || cups[7..12].all?(&:empty?)
  end

  def winner
    case cups[6] <=> cups[13]
    when -1
      name2
    when 0
      :draw
    when 1
      name1
    end
  end
end

class InvalidStartingCup < StandardError
end
