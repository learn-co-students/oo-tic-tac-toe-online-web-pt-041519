require 'pry'

# Build object oriented TicTacToe game
class TicTacToe
  attr_accessor :board
  
  # Store winning combinations for comparison later
  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], # Bottom row
    [0,3,6], # Left column 
    [1,4,7], # Middle column 
    [2,5,8], # Right column 
    [0,4,8], # Top left-to-right diagonal 
    [2,4,6], # Top right-to-left diagonal 
  ]

  # Initialize game with empty board
  def initialize
    @board = Array.new(9, " ")
  end

  # Puts current board based on state of @board
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  # Translate 1-9 user input into array index and return. Account for string variable type and array length 0-8
  def input_to_index(user_input)
    user_input.to_i - 1
  end

  # Record player's move based on @board index position and player token (X or O); default to X token
  def move(index, token = "X")
    @board[index] = token
  end

  # Return true if board position is taken (is not " ")
  def position_taken?(index)
    @board[index] != " "
  end

  # Return true if desired index position is within array && isn't already taken
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  # Return number of filled @board elements
  def turn_count
    @board.count{|token| token != " "}
  end

  # Determine whether X's or O's turn
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  # Define complete user turn
  def turn
    # Get user input
    puts "Please enter a position of 1-9:"
    user_input = gets.chomp

    #Translate input into index
    index = input_to_index(user_input)

    # If index is valid, make move and show board 
    if valid_move?(index)
      move(index, current_player)
      display_board
    # Else ask for more input
    else 
      turn
    end
  end

  # Return winning array if @board indexes match WIN_COMBINATIONS, otherwise return false/nil
  def won?
    # Map indexes of X and O 
    x_indexes = @board.map.with_index { |x, index| index if x == "X" }.compact
    o_indexes = @board.map.with_index { |o, index| index if o == "O" }.compact

    # Return first combination if X or O indexes match WIN_COMBINATIONS
    WIN_COMBINATIONS.each { |combo| return combo if combo & o_indexes == combo || combo & x_indexes == combo }
    
    # Otherwise return false
    return false
  end

  # Return true if every element in the board contains either an "X" or an "O"
  def full?
    !@board.include?(" ")
  end

  # Return true if board is full and hasn't been won; false if board is neighter won nor full
  def draw?
    full? && !won?
  end

  # Return true if board has been won or is a draw
  def over?
    if won? || draw?
      return true
    else 
      return false
    end
  end

  # Return winning token (X or O) if it exists, otherwise return nil
  def winner
    if won?
      return @board[won?[0]]
    else 
      return nil 
    end
  end

  # Run full game loop
  def play 
    # Take turns until the game is over
    until over?
      turn
    end

    # If the game was won, congratulate the winner
    if won?
      puts "Congratulations #{winner}!"
    # else if the game was a draw, inform players "Cat's Game"
    elsif draw?
      puts "Cat's Game!"
    end  
  end

end
