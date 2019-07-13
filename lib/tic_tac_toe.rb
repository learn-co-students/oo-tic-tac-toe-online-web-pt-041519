require 'pry'
class TicTacToe

WIN_COMBINATIONS =[
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
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
        int = input.to_i
        index = int - 1
    end

    def move(index, string)
        @board[index] = string
    end

    def position_taken?(index)
        if @board[index] == " " && index.between?(0, 8)
            false
        else 
            true
        end
    end

    def valid_move?(index)
        if @board[index] == " " && index.between?(0, 8)
            true
        else 
            false
        end
    end

    def turn_count
        count = 0
        @board.each do |position|
            if position != " "
                count += 1
            else
                count = count
            end
        end
        count
    end

    def current_player
        if turn_count.even? == true
            "X"
        else
            "O"
        end
    end

    def turn
        display_board
        puts "Please enter a number, 1-9"
        input = gets.strip
        index = input_to_index(input)
        #binding.pry
        if valid_move?(index)
            move(index, current_player) 
        else   
            puts "invalid"
            turn
        end
    end

    def won?
        array = []
        WIN_COMBINATIONS.each do |combo|
            combo.each do |index|
                array << @board[index] 
            end
            if array == ["X", "X", "X"] || array == ["O", "O", "O"]
                return combo
            else
                array.clear
            end
        end
        return false
    end

    def full?
        if turn_count == 9
            true
        elsif turn_count < 9
            false
        end
    end

    def draw?
       if won? == false && full? == true
        true
       else
        false
       end
    end

    def over?
        if draw? == true
            true
        elsif won? != false
            true
        else
            false
        end
    end

    def winner
        if won? != false && turn_count.even? == true
            "O"
        elsif won? != false && turn_count.even? == false
            "X"
        else

        end
    end
    
    def play
        puts "Welcome to Tic Tac Toe!"
        while over? == false && draw? == false
            turn
        end
        display_board
        if winner == "O"
            puts "Congratulations O!"
        elsif winner == "X"
            puts "Congratulations X!"
        else 
            puts "Cat's Game!"
        end
    end

end