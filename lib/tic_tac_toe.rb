require 'pry'

class TicTacToe

    # attr_accessor :board

    def initialize(board = nil)
        @board = board || Array.new(9, " ")
    end

    WIN_COMBINATIONS = [
        [0, 1, 2], # top row win
        [3, 4, 5], # middle row win
        [6, 7, 8], # bottom row win
        [0, 3, 6], # left vertical win
        [1, 4, 7], # middle vertical win
        [2, 5, 8], # right vertical win
        [6, 4, 2], # diagonal win 1
        [0, 4, 8] # diagonal win 2
      ]

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(user_input)
        user_input = user_input.to_i - 1
    end

    def move(user_input, player = "X")
        @board[user_input] = player
    end

    def position_taken?(user_input)
        @board[user_input] == "X" || @board[user_input] == "O" ? true : false
    end
   
    def valid_move?(user_input)
        position_taken?(user_input) == false && user_input.between?(0, 8) ? true : false
    end

    def turn_count
        @board.count{|token| token == "X" || token == "O"}
    end

    def current_player
      turn_count % 2 == 0 ? "X" : "O"
    end
   
    def turn
        puts "Please enter 1-9:"
        user_input = gets.strip
        new_position = input_to_index(user_input)
        if valid_move?(new_position)
            move(new_position, current_player)
        else
            turn
        end
        display_board
    end

    def won?
        WIN_COMBINATIONS.detect do |winning_combination|
            (@board[winning_combination[0]]=="X" && @board[winning_combination[1]]=="X" && @board[winning_combination[2]]=="X") ||
            (@board[winning_combination[0]]=="O" && @board[winning_combination[1]]=="O" && @board[winning_combination[2]]=="O")
        end
    end

    def full?
        !any_empty_spots?
    end

    def draw?
        full? && !won? 
    end

    def over?
        won? || draw?
    end

    def winner
        if won? != nil
            winner = won?
            @board[winner[0]]
        end
        # if winner = won?
        #     @board[winner[0]]
        # end
    end

    def any_empty_spots?
        for i in @board
           if i == " "
                return true
            end
        end
        false
    end
    
    def play
        until over?
            turn
        end
        if won?
            puts "Congratulations #{winner}!"
        elsif draw?
            puts "Cat\'s Game!"
        end
    end

end