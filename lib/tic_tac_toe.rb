class TicTacToe
  
  attr_accessor :board
  
  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6],
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
  
  def input_to_index(players_choice)
    players_choice.to_i - 1
  end
  
  def move(place_on_board, players_token = "X")
    @board[place_on_board] = players_token
  end
  
  def position_taken?(players_move)
    @board[players_move] == "X" || @board[players_move] == "O"
  end
  
  def valid_move?(input)
    input.between?(0, 8) && !position_taken?(input)
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  
  def turn
    input = gets.chomp
    input = input_to_index(input)
    if valid_move?(input)
      move(input, current_player)
    else
      turn
    end
    display_board
  end
  
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
  
  def won?
      winning_combo = nil
    
      WIN_COMBINATIONS.each do |combo|
      position_1 = combo[0]
      position_2 = combo[1]
      position_3 = combo[2]
    
        if board[position_1] == "X" && board[position_2] == "X" && board[position_3] == "X"
          winning_combo = combo
        elsif board[position_1] == "O" && board[position_2] == "O" && board[position_3] == "O"
          winning_combo = combo
        end
      end
    winning_combo
  end
  
  def full?
    turn_count == 9
  end
  
  def draw?
    full? && !won?
  end 
  
  def over?
    won? || draw?
  end 
  
  def winner
    won = ""
    if winner = won?
      won = @board[winner.first]
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