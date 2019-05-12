require 'pry'
class TicTacToe

WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4 ,8],
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

def input_to_index(user_input)
    user_input_index = user_input.to_i - 1
    return user_input_index
end

def move(index, players_token="X")
  @board[index] = players_token
end

  def position_taken?(index)
    if @board[index] == "X" || @board[index] == "O"
      return true
    else
      return false
    end
  end
  
  def valid_move?(index)
    if index.between?(0, 8)
      if position_taken?(index) == false
        return true
      else
        return false
      end
    end
  end
  
  def turn
    puts "Please enter 1-9"
    user_input = gets.chomp
    index = input_to_index(user_input)
    player_token = current_player
    if valid_move?(index) == true
      move(index, player_token)
      display_board
    else
      user_input = gets.chomp
    end
    
  end
  
  def turn_count
  new_array = []
    @board.collect do |element|
      if element == "X" || element == "O"
        new_array << element
      end
    end
    return new_array.length
  end
  
  def current_player
    if turn_count.even?
      return "X"
    else
      return "O"
    end
  end
  
  def won?
    WIN_COMBINATIONS.each do |winning_combination|
      if (@board[winning_combination[0]] == "X" &&
        @board[winning_combination[1]] == "X" &&
        @board[winning_combination[2]] == "X") ||
        (@board[winning_combination[0]] == "O" &&
        @board[winning_combination[1]] == "O" &&
        @board[winning_combination[2]] == "O")
        return winning_combination
      end
    end
    return false
  end

  def full?
    @board.each do |element|
      if element == "X" || element == "O"
      else
        return false
      end
    end
      return true
  end
  
  def draw?
    if full? == true && won? == true
      return false
    elsif
      full? == true && won? == false
      return true
    elsif
      full? == false
        return false
    end
  end
  
  def over?
    if won? == true || full? == true
      return true
    end
  end
  
  def winner
    if won?
      if @board[won?[0]] == "X" &&
        @board[won?[1]] == "X" &&
        @board[won?[2]] == "X"
        return "X"
      else
        return "O"
      end
    end
  end
  
  def play
    until over?
      turn
    end
      if won? == "X"
        puts "Congratulations X!"
      elsif won? == "O"
        puts "Congratulations O!"
      elsif draw?
        puts "Cat's Game!"
      end
  end    
  
end