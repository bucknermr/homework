class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until game_over
      take_turn
    end

    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    unless game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    seq.each do |color|
      system 'clear'
      sleep(0.2)
      puts color
      sleep(0.5)
    end
    system 'clear'
  end

  def require_sequence
    seq.each do |color|
      guess = gets.chomp
      system 'clear'
      unless guess == color
        @game_over = true
        return
      end
    end
  end

  def add_random_color
    seq << COLORS.sample
  end

  def round_success_message
    system 'clear'
    puts 'Nice job! Next sequence....'
    sleep(1)
  end

  def game_over_message
    puts "GAME OVER"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

Simon.new.play
