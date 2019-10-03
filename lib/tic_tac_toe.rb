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
        @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(user_input)
        user_input.to_i - 1
    end

    def position_taken?(index)
        @board[index] == " " || @board[index] == "" || @board[index] == nil ? false : true
    end
    
    def valid_move?(index)
        if position_taken?(index)
            false
        elsif index.between?(0,8)
            true
         end
    end
    
    def current_player
        turn_count.even? ? "X" : "O"
    end
    
    def move(index, current_player = "X")
        @board[index] = current_player
      end
    
    def turn
        puts "Please enter 1-9:"
        user_input = gets.strip
        index = input_to_index(user_input)
        if valid_move?(index)
            move(index, current_player)
            display_board
        else
            turn
        end
    end
    
    def turn_count
        counter = 0
        # binding.pry
        @board.each do |e| 
            if e == "O" || e == "X" 
                counter += 1
            end
        end
        counter
    end
    
    def won?
        WIN_COMBINATIONS.detect do |arr|
          @board[arr[0]] == @board[arr[1]] &&
          @board[arr[1]] == @board[arr[2]] &&
          position_taken?(arr[0])
        end
    end
      
    def full?
        @board.all? {|e| e == "O" || e == "X"}
    end
      
    def draw?
        !won? && full?
    end
      
    def over?
        won? || draw?
    end
      
    def winner
        won? ? @board[won?[0]] : nil
    end
    
    def play
        turn until over?
        if over?
            if won?
                congratulate
            # puts "Congratulations #{winner(board)}!"
            elsif draw?
                puts "Cat's Game!"
            end
        end
    end
    
    def congratulate
        puts "Congratulations #{winner}!"
        # Not sure having this as a discrete method helps me any...
    end
    
    




end
