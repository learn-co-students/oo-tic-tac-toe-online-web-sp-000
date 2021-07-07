class TicTacToe
    def initialize
        @board = Array.new(9, " ")
    end

    # Describes possible winning combinations in Tic Tac Toe.
    WIN_COMBINATIONS = [
        [0,1,2], # Top row
        [3,4,5], # Middle row
        [6,7,8], # Bottom row
        [0,3,6], # Left column
        [1,4,7], # Middle column
        [2,5,8], # Right column
        [0,4,8], # Left-to-right diagonal
        [2,4,6]  # Right-to-left diagonal
    ]

    # Prints current board representation based on @board instance variable.
    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    # Allows user input passed as a string to output to the correct,
    # conrresponding index of the @board array.
    def input_to_index(user_input)
        user_input.to_i - 1
    end

    # Takes in the index in the @board array chosen by the player and
    # the player's token; either "X" or "O". "X" is the default.
    def move(index, current_player = "X")
        @board[index] = current_player
    end

    # Evaluates user's desired move against @board to see if position is already taken.
    def position_taken?(index)
        @board[index] != " " && @board[index] != ""
    end

    # Returns 'true' if move is valid and 'false/nil' if not.
    def valid_move?(index)
        index.between?(0,8) && !position_taken?(index)
    end

    # Encapsulates the logic of a single complete turn.
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

    # Returns the number of turns that have been played.
    def turn_count
        counter = 0
        @board.each do |space|
            if space == "X" || space == "O"
                counter += 1
            end
        end
        counter
    end

    # Determines if it is X's or O's turn.
    def current_player
        turn_count.even? ? "X" : "O"
    end

    # The #won? method that returns 'true' if there is a win and 'false' if not
    def won?
  
    # Iterates through WIN_COMBINATIONS and finds first matching win_combination and returns the winning array.
    WIN_COMBINATIONS.detect do |win_combination|
    
        # Each 'win_index' returns the first, second, and third elements of each winning combo array.
        win_index_1 = win_combination[0]
        win_index_2 = win_combination[1]
        win_index_3 = win_combination[2]
        
        # Each 'position' uses the indices from the winning combos and applies them to the 'board' array.
        position_1 = @board[win_index_1]
        position_2 = @board[win_index_2]
        position_3 = @board[win_index_3]
        
        # Takes first win_combination and checks to see if they are all "X"'s or "O"'s and that the string is not empty.
        position_1 == position_2 && position_2 == position_3 && position_taken?(win_index_1)
        end
    end

    # Returns 'true' for a draw and 'false' for an in-progress game.
    def full?
        # If no 'board_position'/s are empty, returns 'true'. If 'board_position'/s remain empty, returns 'false'.
        if @board.none? {|board_position| board_position == " "}
            true
        end
    end

    # Accepts a 'board' and returns 'true' if the board has not been won but is full,
    # 'false' if the board is not won and the board is not full, and 'false' if the board is won.
    def draw?
        # board is full, but not won
        if full? && !won?
            true
        # board is not full and not won
        elsif full? == false
            false
        # false for game won in first row or game won diagonally
        # elsif won?(board) == [0,1,2] || won?(board) == [0,4,8] || won?(board) == [2,4,6]
        #   false
        end
    end

    # Accepts a 'board' and returns 'true' for a draw, a won game w/ full board,
    # won game w/ incomplete board, and returns 'false' for an in-progress game.
    def over?
        won? || draw?
        # if full? && won?
        #     true
        # elsif won?
        #     true
        # elsif !full? && !won?
        #     false
        # elsif draw?
        #     true
        # end
    end

    # Returns 'X' or 'O' depending on winning token of game.
    def winner
        if won?
            @board[won?[0]]
        end
    end

    # Responsible for game loop.
    def play
        # counter = 0
        # until counter == 9
        #   turn
        #   counter += 1
        # end

        until over?
            turn
        end

        if won?
            puts "Congratulations #{winner}!"
        elsif draw?
            puts "Cat's Game!"
        end
    end
end