class TicTacToe
    
    WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # First column
  [1,4,7], # Second column
  [2,5,8], # Third column
  [0,4,8], # Left diagonal
  [2,4,6], # Right diagonal
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
        index = input.to_i - 1
    end

    def move(index,token)
        @board[index] = token
    end

    def position_taken?(index)
        @board[index] == "O" || @board[index] == "X"
    end

    def valid_move?(index)
        index.between?(0,8) && !position_taken?(index)
    end

    def turn_count
        @board.count{|token| token == "X" || token == "O"}
    end

    def current_player
        turn_count % 2 == 0 ? "X" : "O"
      end

    def turn
        puts "Pick a position from 1 - 9:"
        input = gets.chomp
        index = input_to_index(input)
        if valid_move?(index)
            move(index, current_player)
            display_board
        else
            turn
        end
    end

    def won?
        WIN_COMBINATIONS.detect do |win_combination|
            (@board[win_combination[0]]=="X" && @board[win_combination[1]]=="X" && @board[win_combination[2]]=="X") ||
            (@board[win_combination[0]]=="O" && @board[win_combination[1]]=="O" && @board[win_combination[2]]=="O")
        end 
    end

    def full?
        @board.none?{|position| position == " "}
    end

    def draw?
        !won? && full?
    end

    def over?
        draw? || won?
    end

    def winner
        if won?
            return @board[won?[0]]
        end
        return nil
    end

    def play
        until over?
          turn
        end
        if won?
            puts "Congratulations #{winner}!"
        else
          puts "Cat's Game!"
        end
      end


end