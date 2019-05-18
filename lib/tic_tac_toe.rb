class TicTacToe
  
  def initialize (board = nil)
    @board = board || Array.new(9," ")
  end
   
  WIN_COMBINATIONS = [ [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    @index = input.to_i-1
  end
  
  def move(index, token = "X")
    @board[index] = token 
  end
  
  def position_taken?(index)
    @board[index] != " "
    #is space open...true, so is it taken?..want false
  end 
  
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  
   def turn_count
    @board.count {|space| space != " "}
  end
  
  def current_player
    turn_count.even? ? "X" : "O"
  end
  
  def turn
    #ask 
    puts "Please choose your move, 1-9"
    #get input
    input = gets.strip
    #translate
    index = input_to_index(input)
    #if index valid, make move, show board
    if valid_move?(index)
      token = current_player
      move(index, token)
      display_board
    else
      puts "Invalid move."
      turn
    end
  end
  
  
  def won?
    win_combo = nil 
    
    WIN_COMBINATIONS.each do |combo|
       space_1 = combo[0]
       space_2 = combo[1]
       space_3 = combo[2]
       
       if @board[space_1] == "X" && @board[space_2] == "X" && @board[space_3] == "X"
        win_combo = combo
       elsif @board[space_1] == "O" && @board[space_2] == "O" && @board[space_3] == "O"
        win_combo = combo
     end
    end
    win_combo
  end 
  
  def full?
    turn_count == 9
  end
  
  def draw?
    full? && !(won?) 
  end
  
  def over?
     draw? || full? || won?
  end
  
  def winner
    if won?
      if turn_count.odd?
        "X"
      else
        "O"
      end
    end 
  end
  
  def play 
    until over?
      turn
    end
    if won?
    champ = winner
      puts "Congratulations #{champ}!"
    else draw?
      puts "Cat's Game!"
    end
  end
  
end