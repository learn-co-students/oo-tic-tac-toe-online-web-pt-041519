require 'pry'
class TicTacToe

  WIN_COMBINATIONS = [#nest array meaning [[]]
                     [0,1,2],
                     [3,4,5],
                     [6,7,8],
                     [0,3,6],
                     [1,4,7],
                     [2,5,8],
                     [0,4,8],
                     [2,4,6]
  ]

  def initialize #lifecycle hook- it runs at a ceratin time in the instances's "lifecycle"
    @board = Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts " -----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts " ----------- "
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    #binding.pry
    input.to_i - 1
  end

  def move(index, token= 'X')
    #@board is calling the array, [index] is the location, =token is setting the index = to the token
    @board[index]=token
  end

  def position_taken?(index)
    if @board[index] == "X" || @board[index] == "O"
      true
    else
      false
    end
  end

  def valid_move?(index)
    if !position_taken?(index) && index.between?(0,8)
      true
    else
      false
  end
end

  def turn_count
    #binding.pry
    counter = 0
    @board.each do |spots|
      if spots == "X" || spots == "O"
        counter +=1
      end
    end
    counter
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def turn
    puts "Enter a position between 1-9"
    input = gets.chomp
    index = input_to_index(input)
    if valid_move?(index)
     move(index, current_player)
     display_board
   else turn
     display_board
    end
  end

  def won?
    board_empty = @board.none? { |i| i == "X" || i == "O"}
    if board_empty
      false
    else
      WIN_COMBINATIONS.each do |combo|
        if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X" || @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
          return combo
        end
    end
      return false
  end
end

  def full?
    @board.all? { |empty| empty == "X" || empty == "O"}
  end

  def draw?
    !won? && full? ? true : false
  end

  def over?
    won? || draw? || full? ? true : false
  end

  def winner
    WIN_COMBINATIONS.detect do |combo|
      if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X"
        return "X"
          elsif @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
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
