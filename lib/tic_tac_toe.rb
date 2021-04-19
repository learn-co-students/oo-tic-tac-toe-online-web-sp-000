class TicTacToe
    def initialize
        @board = Array.new(9, " ")
        
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

    def input_to_index(input)
        index = input.to_i - 1
    end

    def move(index, player = "X")
        @board[index] = player
    end

    def position_taken?(index)
        @board[index] != " " 
    end

    def valid_move?(index)
        !position_taken?(index) && (index < 9 && index > -1)
    end

    def turn_count
        @board.count {|x| x == "X" || x == "O"} 
    end

    def current_player
        turn_count % 2 == 0 ? "X" : "O"
    end

    def turn
    puts "Where would you like to go? Enter 1-9"
        input = gets.strip
        index = self.input_to_index(input)
        if valid_move?(index)
            move(index,current_player)
        else
            self.turn
        end
        self.display_board
    end

    def won?
        WIN_COMBINATIONS.each do |combo|
            check_1 = @board[combo[0]]
            check_2 = @board[combo[1]]
            check_3 = @board[combo[2]]
            if (check_1 == check_2) && (check_1 == check_3) && (check_1 == "X" || check_1 == "O")
                return combo
            end
        end
        false
    end

    def full?
        !@board.include?(" ")
    end

    def draw?
        self.full? && !self.won?
    end

    def over?
        self.draw? || self.won?
    end

    def winner
        if self.over? && self.won?
            @board[self.won?[0]]
        else
            nil
        end
    end

    def play
    puts "Welcome to Tic Tac Toe!"
        until self.over?
            self.turn
        end
        if self.winner
            puts "Congratulations #{self.winner}!"
        else
            puts "Cat's Game!"
        end
    end
end