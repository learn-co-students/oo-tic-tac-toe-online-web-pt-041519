require 'pry'
class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], #1st Column
  [1,4,7], #2nd Column
  [2,5,8], #3rd Column
  [0,4,8], #diagonal 1
  [2,4,6] #diagonal 2 
                      ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end #end display_board
  
  def input_to_index(argument)
    players_pick = argument.to_i
    array_index = players_pick - 1 
  end 
  
  def move(array_index, player = "X")
    update_array_at_with(@board, array_index, player)
  end 
  
  def update_array_at_with(array, index, value)
  array[index] = value
  end
  
  def position_taken?(index)
    if @board[index] == " "
      return false
    else
      return true
    end
  end
  
  def valid_move?(index)
    if (0..8).include?(index) && position_taken?(index) == false
      return true
    else 
      return false
    end #end if 
  end 
  
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  
  def ask_for
    puts "Select a position between 1-9"
    user_input = gets.chomp
    return user_input
  end
  
  def turn
  puts "Please enter 1-9:"
  num = gets.chomp
  index = input_to_index(num)
  token = current_player
  if valid_move?(index) == true
    move(index, token)
    display_board
  else
    turn
  end
  end
  
  def won?
    WIN_COMBINATIONS.each {|win_combo|
    index_0 = win_combo[0]
    index_1 = win_combo[1]
    index_2 = win_combo[2]

    position_1 = @board[index_0]
    position_2 = @board[index_1]
    position_3 = @board[index_2]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combo
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combo
    end
  }
  return false
  end
  
  
  def full?
    if !@board.include?(" ") && won? == false
      return true
    end 
    return false
  end
  
  def draw? 
    if full? == true
      return true
    end
    return false
  end
  
  def over?
    if draw? == true
      return true
      elsif won? != false
      return true
    end
    return false
  end
  
  def winner
    if won? == false
      return nil
    else 
      return @board[won?[0]]
    end
  end
  
  def play
    until over? == true
      turn
    end
    if won? != false
      puts "Congratulations #{winner}!"
    elsif draw? == true
      puts "Cat's Game!"
    end
  end 

end #end class