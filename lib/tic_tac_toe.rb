require 'pry'
class TicTacToe

  def initialize(board = nil)
    @board = Array.new(9, " ")
  end

    WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,4,8],
      [2,4,6],
      [0,3,6],
      [1,4,7],
      [2,5,8]
    ]

    def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(string)
      string.to_i - 1
    end

    def move(position, char)
      @board[position] = char
    end

    def position_taken?(index)
      @board[index] == "X" || @board[index] == "O"
    end

    def valid_move?(index)
      index.between?(0, 8) && !position_taken?(index)
    end

    def turn_count
      turn_count = 0
      @board.each do |space|
        if space == "O" || space == "X"
          turn_count += 1
        end
      end
      turn_count
    end

    def current_player
      if turn_count % 2 == 0
        "X"
      else
        "O"
      end
    end

    def turn
      puts "Enter between 1 - 9:"
     input = gets.strip
     index = input_to_index(input)
      if valid_move?(index)
        move(index, current_player)
      else
        turn
      end
      display_board
    end

   def won?
     WIN_COMBINATIONS.detect do |win_combo|
       @board[win_combo[0]] == @board[win_combo[1]] && @board[win_combo[1]] == @board[win_combo[2]] && position_taken?(win_combo[0])
     end
   end

  #    WIN_COMBINATIONS.each do |win_combo|
   #
  #     if @board[win_combo[0]] == @board[win_combo[1]] && @board[win_combo[1]] == @board[win_combo[2]]
  #       return win_combo
  #     end
  #    end
  #    nil
  #  end

  def full?
    @board.all? {|i| i == "X" || i == "O"}
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw?
  end

  def winner
    WIN_COMBINATIONS.each do |win_combo|
      if @board[win_combo[0]] == "X" && @board[win_combo[1]] == "X" && @board[win_combo[2]] =="X"
        return "X"
      elsif @board[win_combo[0]] == "O" && @board[win_combo[1]] == "O" && @board[win_combo[2]] =="O"
        return "O"
      end
    end
    nil
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
