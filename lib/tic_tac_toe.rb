require "pry"

class TicTacToe

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], # Bottom row
    [0,3,6], # First Column
    [1,4,7], # Second Column
    [2,5,8], # Third Column
    [0,4,8], # Diag top-left to bottom-right
    [6,4,2]  # Diag bottom-left to top-right
  ]

  # initializes the board with an empty array
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  # prints the current board representation based on the @board instance variable
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  # we pass in user input as arg and returns us the corresponding index of the @board array (need a -1 in there)
  def input_to_index(input)
    input.to_i - 1
  end

  # has 2 args, index of @board, and token of default "X"
  def move(index, token = "X")
    @board[index] = token
  end

  # check to see if position is vacant or if it contains "X" or "O"
  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O"
  end

  # return true if valid and false or nil if not
  # position has to be present on the game board [o] - [8]
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  # returns the number of turns that've been played based on @board
  # binding.pry @board to see wassssaaaap
  def turn_count
    @board.count {|token| token == "X" || token == "O"}
  end

  # uses the #turn_count method to see whose turn (X or O)
  # turn 3 is X, turn 4 is O, turn 5 is X, turn 6 is O 
  def current_player
    #binding.pry
    turn_count % 2 == 0 ? "X" : "O"
  end

  # encapsulate the logic on a single compete turn
  # ask user to pick 1-9(puts), receive user input (gets.chomp.to_i) 
  # if move valid?, make the move and display board (use the methods above)
  # else not valid? ask for new move until valid move is received 
  def turn
    puts "Your turn, pick a position between 1-9"
    input = gets.chomp
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  # use WIN_COMBINATIONS. return the winning combo indexes as an array if theres a win
  def won?
    WIN_COMBINATIONS.map do |array|
      if @board[array[0]] == "X" && @board[array[1]] == "X" && @board[array[2]] == "X"
        return array
      elsif @board[array[0]] == "O" && @board[array[1]] == "O" && @board[array[2]] == "O"
        return array
      end
    end
    false
  end

  def full?
    turn_count == 9
  end

  def draw?
    if full?
      won? == false
    end
  end

  def over?
    draw? || won?
  end
  
  def winner
    return @board[won?[0]] if won?
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

