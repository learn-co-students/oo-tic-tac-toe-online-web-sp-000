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

     attr_accessor :board

     def initialize
        @board = [" "," "," "," "," "," "," "," "," "]
     end

     def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
        puts "-----------"
     end

     def input_to_index(input)
        input.to_i - 1
     end

     def move(index, token='X')
        @board[index] = token
     end

     def position_taken?(index)
        @board[index] == 'X' || @board[index] == 'O'
     end

     def valid_move?(index)
        index.between?(0, 8) && !position_taken?(index)
     end

     def turn
        puts "Choose a position from 1-9: "
        input = gets.strip
        index = input_to_index(input)
        
        if valid_move?(index)
            move(index, current_player)
            display_board
        else
            turn
        end
     
    end

     def turn_count
        @board.select { |index| index == 'X' || index == 'O' }.size
     end

     def current_player
        turn_count.even? ? 'X' : 'O'
     end

     def won?
        WIN_COMBINATIONS.each do |win|
            if [ ['X', 'X', 'X'], ['O', 'O', 'O'] ].include?([ @board[win[0]], @board[win[1]], @board[win[2]] ])
                return win
            end
        end
        nil
     end

     def full?
        @board.all? { |index| index == 'X' || index == 'O' }
     end

     def draw?
        full? && !won?
     end

     def over?
        won? || draw?
     end

     def winner
        if won?
            return @board[won?[0]]
        end
        nil
     end

     def play
        until over?
            turn
        end
        
        if winner
            puts "Congratulations #{winner}!"
        else
            puts "Cat's Game!"
        end
     end

end