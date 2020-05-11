class TicTacToe
    WIN_COMBINATIONS = [
        #horizontal
        [0,1,2],
        [3,4,5],
        [6,7,8],
        #vertical
        [0,3,6],
        [1,4,7],
        [2,5,8],
        #diagonal
        [0,4,8],
        [2,4,6]
    ]

    def initialize
        @board = Array.new(9, " ")
    end

    def display_board
        row = "-----------"
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts row
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts row
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} " 
    end

    def input_to_index(input)
        input_to_int = input.to_i
        index = (input_to_int - 1)
        index
    end

    def move(index, token="X")
        @board[index] = token
    end

    def position_taken?(index)
        if (@board[index] == "X" || @board[index] =="O")
            true
        else
            false
        end        
    end

    def valid_move?(index)
        if(index >= 0 && index <= 8 && position_taken?(index) == false)
            true
        else
            false
        end                
    end

    def turn
        puts "Please enter 1-9:"
        move_input = gets.strip
        index = input_to_index(move_input)        
        if (valid_move?(index) == true)
            move(index, current_player)      
            display_board
        else
            puts "That move was invalid. PLease enter a new move."
            turn
        end    
    end

    def turn_count
        show_count = 0
        @board.each do |element|
            if (element == "X" || element == "O")
                show_count += 1
            end
        end    
        show_count
    end

    def current_player
        calc_current_player = turn_count % 2
        if (calc_current_player == 0)
            "X"
        else
            "O"
        end        
    end

    def won?
        show_win_combo = false
        WIN_COMBINATIONS.each do |combo| 
            if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X" || @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
              show_win_combo = combo
            end
        end
        show_win_combo    
    end

    def full?
        full_status = true 
        @board.each do |element|
            if (element == "" || element == " "|| element == nil)
                full_status = false
            end    
        end
        full_status       
    end

    def draw?
        if (won? == false && full? == true)
            true
        else
            false
        end        
    end

    def over?
        if (won? != false || draw? == true)
            true
        else
            false
        end        
    end

    def winner
        show_winner = nil
        WIN_COMBINATIONS.detect do |combo| 
            if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X" 
                show_winner = "X"
            elsif @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
                show_winner = "O"

            end
        end
        show_winner       
    end

    def play
        until over? == true do
            turn
        end

        if (won? != false)
            winner_status = winner
            puts "Congratulations #{winner_status}!"
        elsif (draw? == true)
            puts "Cat's Game!"
        end        
    end    
end