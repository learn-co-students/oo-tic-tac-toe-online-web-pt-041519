class TicTacToe


WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
  ]

def initialize
  @board = Array.new(9, " ")
end

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(input)
  input.to_i - 1 
end

def move(index, token = "X")
  @board[index] = token
end

def position_taken?(index)
  if @board[index] == "X" || @board[index] == "O"
    return true
  else
    return false
  end
end

def valid_move?(index)
  !position_taken?(index) && index.between?(0,8)
end

def turn_count
  @board.count{|token| token == "X" || token == "O"}
  end

def current_player
  total_turns = turn_count
  if total_turns % 2 == 0
    player = "X"
  else
    player = "O"
  end
  return player
end

  def turn
    puts "Please choose a number 1-9:"
        user_input = gets.chomp
        index = input_to_index(user_input)
    if valid_move?(index)
         player_token = current_player
         move(index, player_token)
         display_board
    else
         turn
    end
  end

  def won? 
  WIN_COMBINATIONS.each do |win|
     if @board[win[0]] == @board[win[1]] && @board[win[1]] == @board[win[2]] && @board[win[0]] != " "
     return win
    end
    end
        false
    end
  
  def full?
      @board.all? {|index| index == "X" || index == "O"}
  end
 
 
  def draw?
    full? && !won?
  end 
  
  def over?
    won? || draw?
  end
  
  def winner
    WIN_COMBINATIONS.detect do |co|
    if @board[co[0]] == "X" && @board[co[1]] == "X" && @board[co[2]] == "X"
    return "X"
     elsif @board[co[0]] == "O" && @board[co[1]] == "O"  && @board[co[2]] == "O"
    return "O"
     else
          nil
      end
    end
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
  
    
 



  








