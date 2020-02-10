class TicTacToe

    def initialize
        @board = [" "," "," "," "," "," "," "," "," "]
    end

    WIN_COMBINATIONS = [
        [0,1,2], # Top row
        [3,4,5], # Middle row
        [6,7,8], # Bottom row
        [0,3,6], # Left column
        [1,4,7], # Middle column
        [2,5,8], # Right column
        [0,4,8], # Left diagonal
        [2,4,6]  # Right diagonal
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
  
    def move(index, current_player)
        @board[index] = current_player
    end

    def position_taken?(index)
        !(@board[index].nil? || @board[index] == " ")
    end
  
    def valid_move?(index)
        index.between?(0,8) && !position_taken?(index)
    end
  
    def turn
        puts "Please enter 1-9:"
        input = gets.strip
        index = input_to_index(input)
        if valid_move?(index)
            move(index, current_player)
            display_board
         else
            turn
        end
    end

    def current_player
        case turn_count % 2
            when 0
                "X"
            else
                "O"
        end
    end

    def turn_count
        counter = 0
        @board.each{|i| counter += 1 if i == "X" || i == "O"}
        counter    
    end

    def won?
        WIN_COMBINATIONS.each do |combo|
  
            pos1 = combo[0]
            pos2 = combo[1]
            pos3 = combo[2]
  
            if @board[pos1] == "X" && @board[pos2] == "X" && @board[pos3] == "X"
                return combo
            elsif @board[pos1] == "O" && @board[pos2] == "O" && @board[pos3] == "O"
                return combo
            end
        end
        false
    end

    def full?
        @board.all? {|i| i == "X" || i == "O"}
    end
  
    def draw?
        if full? && !won?
            return true
        else
            false
        end
    end
  
    def over?
        true if won? || full? || draw?
    end
  
    def winner
        @board[won?[0]] if won?
    end

    def play
        until over?
            turn
        end
        puts "Cat's Game!" if draw?
        puts "Congratulations #{winner}!"
    end

end