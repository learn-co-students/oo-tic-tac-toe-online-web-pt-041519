class TicTacToe
  
  WIN_COMBINATIONS = [[0,1,2], [0,3,6], [0,4,8], [1,4,7], [2,4,6], [2,5,8], [3,4,5], [6,7,8]] 
  
  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
  end
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} " 
  end 
  
  def input_to_index(input)
    index = input.to_i - 1 
    index
  end 
  
  def move(index, token = "X")
    @board[index] = token
  end
  
  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O"
  end 
  
  def valid_move?(index)
    !position_taken?(index) && index.between?(0,8)
  end 
  
  def turn_count
    count = 0
    @board.each do |index|
      if index == "X" || index == "O"
        count += 1 
      end 
    end 
    count
  end
  
  def current_player
    turn_count.odd? ? "O" : "X"
  end 
  
  def turn 
    loop do 
      puts "Please choose your next move"
      input = gets 
      index = input_to_index(input)
      if valid_move?(index)
        move(index, current_player)
        display_board
        break
      end 
    end
  end 
  
  def won?
    WIN_COMBINATIONS.each do |arr|
      if @board[arr[0]] == "X" && @board[arr[1]] == "X" && @board[arr[2]] == "X"
        return arr
      elsif @board[arr[0]] == "O" && @board[arr[1]] == "O" && @board[arr[2]] == "O"
        return arr 
      end
    end
    false
  end 
  
  def full?
    @board.each do |i|
      if i != "X" && i != "O"
        return false
      end 
      true 
    end 
  end 
  
  def draw?
    if full? && !won?
      return true 
    elsif won? || !won? && !full?
      return false 
    end 
  end 
  
  def over?
    won? || draw?
  end 
  
  def winner
    if !won?
      return nil
    else 
      @board[won?[0]]
    end
  end 
  
  def play 
    while !over?
      turn 
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end 
  end 
  
  
  
end 


