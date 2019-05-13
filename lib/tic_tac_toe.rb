require 'pry'
class TicTacToe
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
    def initialize
        @board = [" "," "," "," "," "," "," "," "," "]
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(input)
        input.to_i-1
    end

    def move(index, token = "X")
        @board[index] = token
    end

    def position_taken?(index)
        @board[index] != " "
    end

    def valid_move?(index)
        @board[index] && !position_taken?(index)
    end

    def turn_count
        @board.count {|x| x != " "}
    end

    def current_player
        turn_count % 2 == 0 ? "X" : "O"
    end

    def turn
        input = ""
        until input.to_i.between?(1,9) do
            puts "Please enter a position between 1 and 9: "
            input = gets.chomp
        end
        index = input_to_index(input)
        if valid_move?(index)
            move(index, current_player)
            display_board
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
        @board.all? {|x| x == "X" || x == "O"}
    end

    def draw?
        full? && !won?
    end

    def over?
        won? || draw?
    end

    def winner
        return @board[won?[0]] if won?
        nil
    end

    def play
        until over? do
            turn
        end
        if won?
            puts "Congratulations #{winner}!"
        else
            puts "Cat's Game!"
        end
    end
end