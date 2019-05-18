class TicTacToe

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def move(index, play_char)
    @board[index] = play_char
  end

  def position_taken?(index)
    @board[index] != " "
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    @board.count {|elem| elem != " "}
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def turn
    puts "Your move:"
    input = gets
      index = input_to_index(input)
      if valid_move?(index)
        play_char = current_player
        move(index, play_char)
      else
        puts "Your move:"
        move = gets
      end
    display_board
  end

  def won?
    WIN_COMBINATIONS.any? do |line|
      if position_taken?(line[0]) && @board[line[0]] == @board[line[1]] && @board[line[1]] == @board[line[2]]
        return line
      end
    end
  end

  def full?
    @board.all? { |space| space != " "}
  end

  def draw?
    if !won? && full?
      true
    elsif won?
      false
    else
      false
    end
  end

  def over?
    won? || draw?
  end

  def winner
    if line = won?
      @board[line[0]]
    end
  end

  def play
    turn until over?
    if over? == won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end

end
