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
  
  def move(index, player_token = "X") 
    @board[index] = player_token 
  end 
  
  def position_taken?(index)
    @board[index] == " " ? false : true 
  end   
 
  def valid_move?(index)
   !position_taken?(index) && index.between?(0,8) ? true : false 
  end 
 
  def turn_count
   turn_count = 0 
     @board.each do |position|
       if position == "X" || position == "O"
         turn_count += 1 
       end 
      end 
    turn_count 
  end 
  
  def current_player
   turn_count.even? ? "X" : "O"
  end 
 
  def turn 
   puts "enter 1-9"
   input = gets
   index = input_to_index(input)
   
   if valid_move?(index)
     token = current_player
     move(index, token)
     display_board
   else 
     turn 
   end 
  end 
 
  def won?
    WIN_COMBINATIONS.any do |combo|
      if position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
        return combo
      end 
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
    if won? 
    end 
  end 
  
  def play 
    while !over? 
      turn 
    end 
    if won? 
      puts "Congratulations #{winner}"
    elseif draw? 
      puts "Cat's Game!"
    end 
  end 
  
  
 
end 