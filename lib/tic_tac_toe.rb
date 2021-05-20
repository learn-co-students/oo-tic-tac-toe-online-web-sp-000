class TicTacToe

    def initialize(board = nil)
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
        [2,4,6]
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

    def move(index, token)
        @board[index] = token
    end

    def position_taken?(index)
        !(@board[index].nil? || @board[index] == " ")
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
        turn_count % 2 == 0 ? "X" : "O"
    end

    def turn
        user_input = gets.strip
        index = input_to_index(user_input)
        if valid_move?(index)
            player_token = current_player
            move(index, player_token)
        else
            turn
        end
        display_board
    end

    def won?
        WIN_COMBINATIONS.each do |win_combo|
            win_index_1 = win_combo[0]
            win_index_2 = win_combo[1]
            win_index_3 = win_combo[2]
            position_1 = @board[win_index_1]
            position_2 = @board[win_index_2]
            position_3 = @board[win_index_3]
        
            if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
              return win_combo
            end
        end
        false
    end

    def full?
        @board.all? {|i| i == "X" || i == "O"}
    end

    def draw?
        !won? && full? ? true : false
    end

    def over?
        won? || draw? || full? ? true : false
    end

    def winner
        winning_player = []
        winning_player = won?
        won? ? @board[winning_player[0]] : nil
    end

    def play
        until over? == true
            turn
        end

        if won?
            winner
            puts "Congratulations #{winner}!"
        elsif draw?
            puts "Cat's Game!"
        end
    end
    
end