class TicTacToe

  # Create an array with nine empty values
  def initialize(board= nil)
    @board = board || Array.new(9," ")
  end

  # Input random input combinations
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  # Crate a board game CLI
  def display_board
    a = " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    b = " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    c = " #{@board[6]} | #{@board[7]} | #{@board[8]} "

    puts a
    puts "-----------"
    puts b
    puts "-----------"
    puts c
  end

  # Get the player's input the board
  def input_to_index(input)
    index = input.to_i - 1
  end

  # Turn the player's input as token either X or O (in this case its X)
  def move(input, current_player = "X")
    @board[input] = current_player
  end

  # Obtain the desired position of the player against the board's index
  def position_taken?(index)
    if  @board[index]== "X" || @board[index]== "O"
        true
    else
        false
    end
  end

  # Check if the player's input or position is valid
  def valid_move?(input)
    input.between?(0,8) && !position_taken?(input)
  end

  # Obtain's the player's option using the initialize array then check's the player's valid or invalid move
  def turn
    puts "Please choose a number 1-9:"
    input = gets.chomp
    index = input_to_index(input)
    if valid_move?(index)
      player_token = current_player
      move(index, player_token)
      display_board
    else
      turn
    end
  end

  # Return's the player's turns that use counter increment and XOR for each token
  def turn_count
    counter = 0
    @board.each do |place|
      if place == "X" || place == "O"
        counter += 1
      end
    end
      turn_count = counter
  end

  # Obtain's the player's counter turn and determine the token type, in this case it use % 2 for each player (if/else)
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  # It check the player if it won using WIN_COMBINATIONS through each (wc) method
  def won?
    WIN_COMBINATIONS.each do |wc|
      if @board[wc[0]] == @board[wc[1]] && @board[wc[0]] == @board[wc[2]] && @board[wc[0]] != " "
        return wc
      end
    end
    false
  end

  # It check's the board if its full of token and not allow the player to input additional token
  def full?
     all_full = @board.all? do |position|
       position != " "
     end
   end

   # Check's the player if it won or not after filling up the board
   def draw?
     full = full?

     if won? != false  && full == false
       false
     end
     if won? == false && full == true
       true
     end
   end

  # If the board is full it returns the game as over at the same time it detects the winner
  def over?
    if won? == true || full? == true
       true
    end
  end

  # It check's if the player is the winner through token combination otherwise it return nil
  def winner
    WIN_COMBINATIONS.detect do |co|
      if @board[co[0]] == "X" && @board[co[1]] == "X" && @board[co[2]] == "X"
          return "X"
      elsif @board[co[0]] == "O" && @board[co[1]] == "O" && @board[co[2]] == "O"
          return "O"
      else
          nil
      end
    end
  end

  # TicTacToe gamplay trigger via bin
  def play
    over = over?

    until  over == true
      if won?!= false
       break
      end

      if draw? == true
       break
      end

      turn
      over = over?
    end

    if won?!= false
      winner
      puts "Congratulations #{winner}!"
    end

    if draw? == true
      puts "Cat's Game!"
    end

  end


end
