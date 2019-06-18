require 'pry'

class TicTacToe
  
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
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

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def position_taken?(index)
    if @board[index] == " "
      return false
    else
      return true
    end
  end
  
  def valid_move?(index)
    index.between?(0,8) && @board[index] == " "
  end
 
  def turn
    puts "What is your move? Enter 1-9."
    answer = gets.chomp
    index = self.input_to_index(answer)
  
    if self.valid_move?(index) == true
      @board[index] = self.current_player
      self.display_board
    else  
      turn
    end
  end
  
  
  def won?
    WIN_COMBINATIONS.each do |combo| 
      board_elements = combo.map{ |index| @board[index] }
      if board_elements.all? { |e| e == "X" } || board_elements.all? { |e| e == "O" }
        return combo
      end
    end
    return false
  end
  
  def full?
    !@board.any? { |e| e == " " }
  end
  
  def draw?
    if self.full? && !self.won?
      return true
    else
    self.won?
      return false
    end
  end
  
  def over?
    if self.won? || self.draw?|| self.full? 
      true
    else
      false
    end
  end
  
  def winner
    if self.won? && self.current_player != "X"
      return "X"
    elsif self.won? && self.current_player != "O"
      return "O"
    else
      return nil
    end
  end
  
  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts  "Cat's Game!"
    end
  end
  
end