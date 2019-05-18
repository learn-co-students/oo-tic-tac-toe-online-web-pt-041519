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
  
  def input_to_index(string)
    string.to_i - 1 
  end 
  
  def move(number, token)
    @board[number] = token
  end
  
  def position_taken?(index)
    index.between?(0, 8) && @board[index] != " "
  end
  
  def valid_move?(index)
    index.between?(0, 8) && @board[index] == " "
  end
  
  def turn
    move = gets.chomp
    index = input_to_index(move)
    unless valid_move?(index)
      puts "Try again!"
      index = input_to_index(gets.chomp)
    end
    @board[index] = current_player
    display_board
  end
  
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
    if won?
     turn_count % 2 == 0 ? "O" : "X"
    end
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
 
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
 
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    end
    if draw?
      puts "Cat's Game!"
    end
  end

end