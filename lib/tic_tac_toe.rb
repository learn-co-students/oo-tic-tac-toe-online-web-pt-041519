class TicTacToe
  attr_accessor :board

  def initialize(board=nil)
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

   def display_board
       puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
       puts "-----------"
       puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
       puts "-----------"
       puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
     end

    def input_to_index(user_input)
      input = user_input.to_i - 1
      input
    end

    def move(index, token = "X")
      @board.map!.with_index do |x, i|
          i == index ? token : x
        end
     end

    def position_taken?(index)
      @board[index] == " " ? false : true
    end

    def valid_move?(index)
      index.between?(0,9) ? @board[index].include?(" ") : nil
    end

    def turn_count
    @board.count{|token| token == "X" || token == "O"}
    end

    def current_player
      turn_count % 2 == 0 ? "X" : "O"
    end

    def turn
      puts "Please input a position between 1-9"
      user_input = gets.chomp
      index = input_to_index(user_input)

      if valid_move?(index)
        token = current_player
        move(index, token)
      else
        turn
      end
      display_board

        # puts "invalid"
        # puts "Please input a position between 1-9"
        # user_input = gets.chomp

    end

    def won?
      WIN_COMBINATIONS.any? do |combo|
        if position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
          return combo
        end
      end
    end

    def full?
      if @board.any? {|x| x == " "}
        false
      else
        true
      end
    end

    def draw?
      if full? && !won?
        true
      end
    end

    def over?
      won? || draw?
    end

    def winner
      if won?
      @board[won?[0]]
      end
    end

    def play
      turn until over?
      puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
    end
  end
