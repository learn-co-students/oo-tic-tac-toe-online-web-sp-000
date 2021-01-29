class TicTacToe

    attr_accessor :board

    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [6,4,2],
    ]

    def initialize
        @board = [" "," "," "," "," "," "," "," "," ",]
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(input)
        input.to_i - 1
    end

    def move(index, token)
        @board[index] = token
    end

    def position_taken?(index)
        @board[index] == "X" || @board[index] == "O"
        #the OR statement needs to reiterate argument otherwises 
        #its "board index is equal to X ELSE "O"
    end

    def valid_move?(index)
        index.between?(0,8) && !position_taken?(index)
    end

    def turn_count
        @board.count {|i| i == "X" || i == "O"}
    end

    def current_player
        turn_count.odd? ? "O" : "X"
    end

    def turn
        #ask user for move
        #receive input
        #input_to_index
        #valid_move?
            #if true - make move and show board
            #if false - start at beginning

        puts "Please enter 1-9:"
        input = gets.strip
        index = input_to_index(input)
        token = current_player
        if valid_move?(index)
            move(index, token)
            display_board
        else 
            turn
        end
    end

    def won?
        WIN_COMBINATIONS.detect {|win_combination| @board[win_combination[0]] == @board[win_combination[1]] && @board[win_combination[1]] == @board[win_combination[2]] && position_taken?(win_combination[0])}
        #we need all three win_combination indexes to equal position_taken?(index)
        # 0 is same as 1, 1 is same 2 AND they are all X or O
    end

    def full?
        board.all?{|spot| spot == "X" || spot == "O"}
    end

end
