class TicTacToe
    WIN_COMBINATIONS = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [2, 4, 6],
    ]

    def initialize
        @board = Array.new(9, " ")
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(input)
        input = input.to_i - 1
    end

    def move(input, token = "X")
        @board[input] = token
    end

    def position_taken?(input)
        @board[input] == "X" || @board[input] == "O"
    end

    def valid_move?(input)
        !position_taken?(input) && (0..8).include?(input)
    end

    def turn_count
        @board.count {|i| i == "X" || i == "O"}
    end

    def current_player
        turn_count % 2 == 0 ? "X" : "O"
    end

    def turn
        puts "Enter a number between 1-9: "
        input = gets.chomp
        input = input_to_index(input)

        if valid_move?(input) == true
            @board[input] = current_player
            display_board
        else
            turn
        end
    end

    def won?
        WIN_COMBINATIONS.each do |win_combo|
            index_0 = win_combo[0]
            index_1 = win_combo[1]
            index_2 = win_combo[2]
      
            position_1 = @board[index_0]
            position_2 = @board[index_1]
            position_3 = @board[index_2]
      
            if position_1 == "X" && position_2 == "X" && position_3 == "X"
                return win_combo
            elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
                return win_combo
            end
        end
        return false
    end

    def full?
        !@board.any?(" ")
    end

    def draw?
        !won? && full?
    end

    def over?
        won? || full?
    end

    def winner
        if won?
            current_player == "X"? "O" : "X"
        end
    end

    def play
        until won? || over? || draw?
            turn
        end
        
        if won?
          puts "Congratulations #{winner}!"
        else
          puts "Cat's Game!"
        end
    end
end