
class TicTacToe

    def initialize
        @board = Array.new(9, " ")
    end

    WIN_COMBINATIONS = [
        [0, 1, 2], # Top row
        [3, 4, 5], # Middle row
        [6, 7, 8], # Bottom row
        [0, 3, 6], # Left column win
        [1, 4, 7], # Middle column win
        [2, 5, 8], # Right column win
        [0, 4, 8], # Left to right downward diagonal
        [2, 4, 6]  # Left to right upward diagonal
    ]

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

    def move(index, player_token = "X")
        @board[index] = player_token
    end

    def position_taken?(index)
        if @board[index] != " " && @board[index] != ""
            true
        else
            false
        end
    end

    def valid_move?(index)
        if index.between?(0,8) && !position_taken?(index)
            true
        else
            false
        end
    end

    def turn_count
        @board.count{|token| token == "X" || token == "O"}
    end

    def current_player
        if turn_count.even?
            return "X"
        elsif turn_count.odd?
            return "O"
        end
    end

    def turn
        puts "Please enter 1-9:"
        input = gets.strip
        index = input_to_index(input)
        if valid_move?(index) && current_player == "X"
          move(index, "X")
          display_board
        elsif valid_move?(index) && current_player == "O"
          move(index, "O")
          display_board
        else
          turn
        end
    end

    def won?
        WIN_COMBINATIONS.detect do |combination|
          @board[combination[0]] == @board[combination[1]] && 
          @board[combination[1]] == @board[combination[2]] && 
          position_taken?(combination[0])
        end
    end

    def full?
        @board.all? do |element| 
        element == "X" || element == "O"
        end
    end

    def draw?
        if full? && !won?
            true
        else
            false
        end
    end

    def over?
        won? || full? || draw?
    end

    def winner
        if won?
          @board[won?.first]
        else
          nil
        end
    end

    def play
        until over?
          turn
          won?
        end

        if winner
            puts "Congratulations #{winner}!"
        elsif draw?
            puts "Cat's Game!"
        end   
    end

end