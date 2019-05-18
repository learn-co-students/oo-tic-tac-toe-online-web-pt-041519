class TicTacToe
  
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end 
  
  WIN_COMBINATIONS = [
    [0,1,2], #Top Row
    [3,4,5], #Middle Row
    [6,7,8], #Bottom Row 
    [0,3,6], #Left Column
    [1,4,7], #Middle Column
    [2,5,8], #Right Column
    [0,4,8], #left Diagonal 
    [2,4,6]  #Right Diagonal
    ]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts " -----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts " -----------" 
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end 
   
  def input_to_index(input)
    index = input.to_i - 1 
  end
  
  def move(index, player = "X") 
    @board[index] = player
  end 
  
  def position_taken?(index)
    @board[index] == " " ? false : true 
  end   
 
  def valid_move?(index)
   !position_taken?(index) && index.between?(0,8) ? true : false 
  end 
 
  def turn_count
    @board.count { |player_move| player_move == "X" || player_move == "O" }
  end 
  
  def current_player
   turn_count.even? ? "X" : "O"
  end 
 
  def turn 
   puts "Please enter 1-9:"  #ask for input 
   input = gets.strip  #get input 
   index = input_to_index(input)   #translate input into index 
   
   if valid_move?(index)   #if index is valid 
     move(index, current_player)   #make the move for index 
     display_board  #show board 
   else 
     turn  #else ask for input again 
   end 
  end 
 
  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board[combo[0]] == @board[combo[1]] && @board[combo[0]] ==  @board[combo[2]] && position_taken?(combo[0])
    end
  end
 
  def full? 
   @board.all? do |position|
     position == "X" || position == "O"
   end 
  end
  
  def draw?
    full? && !won? 
  end 
  
  def over? 
    draw? || won? 
  end 
  
  def winner 
    if combo = won?
        @board[combo[0]]
      else
        return nil
    end
  end 
  
  def play 
     until over? do
      turn
     end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end 
  
end 