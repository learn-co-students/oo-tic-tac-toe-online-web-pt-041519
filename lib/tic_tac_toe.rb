require 'pry'

class TicTacToe
  attr_accessor :board
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

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

  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O"
  end

  def valid_move?(index)
    index.between?(0, 8) && !position_taken?(index)
  end

  def turn
    choice = gets
    index = input_to_index(choice)
    until valid_move?(index)
      choice = gets
      index = input_to_index(choice)
    end
    move(index, current_player)
    display_board
  end

  def turn_count
    @board.count { |spot| spot == "X" || spot == "O" }
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.detect { |combo| combo.all? { |index| @board[index] == "X" } || combo.all? { |index| @board[index] == "O" } }
  end

  def full?
    @board.count { |spot| spot == " " } == 0
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    @board[won?[0]] if won?
  end

  def play
    turn until over?
    puts won? ? "Congratulations #{winner}!" : "Cat's Game!"
  end
end
