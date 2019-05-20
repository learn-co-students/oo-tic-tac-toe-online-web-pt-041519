require 'pry'
class TicTacToe
attr_accessor

def initialize
  @board = Array.new(9," ")
end  

WIN_COMBINATIONS = [[0,1,2],[0,3,6],[0,4,8],[1,4,7],[2,5,8],[3,4,5],[6,7,8],[2,4,6]]

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end  

def input_to_index(input)
  if input.match?(/\d/)
    input.to_i - 1 
  else 
    "invalid"
  end  
end

def move(index, token="X")
  @board[index] = token
end

def position_taken?(index)
  @board[index] == " " ? false : true
end  

def valid_move?(index)
  index.to_s.match?(/[0-8]/) && position_taken?(index)== false ? true : false
end    

def turn
  puts "Please enter a number between 1 and 9"
  index = input_to_index(gets.chomp)
  while valid_move?(index) == false
    puts "Please enter a number between 1 and 9"
    index = input_to_index(gets.chomp)
  end
  move(index, current_player)
  display_board
end 

def turn_count
  9 - @board.count(" ")
end   
  
def current_player
  turn_count % 2 == 0 ? "X" : "O"
end  

def won?
  WIN_COMBINATIONS.each do |combo| 
    if @board[combo[0]] != " " 
      if @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]] 
      return combo
      end
    else 
      false
    end
  end  
  return false
end

def full?
  turn_count == 9 ? true: false
end

def draw?
  full? == true && won? == false ? true : false
end

def over?
  won? != false || draw? == true ? true : false
end 

def winner
  if won? == false 
     nil 
  else 
    @board[won?[0]]
  end  
end

def play 
  until over? == true 
    turn
  end  
  if won? != false
    #binding.pry
    puts "Congratulations #{winner}!"
  end  
   if draw? == true
    puts "Cat's Game!"
   end  
end  

end