class TicTacToe 

  def initialize(board = nil) 
   @board = board || Array.new(9, " ")
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

 def input_to_index(user_input)
  user_input.to_i - 1
 end

def move(location, token = "X")
  @board[location] = token
end

def position_taken?(user_input)
  if @board[user_input] == "X" || @board[user_input] == "O"
    return true
  else
    return false
  end
end

def valid_move?(location)
  if @board[location] == "X" || @board[location] == "O"
    return true
  else
    return false
  end
end


end


      





  








