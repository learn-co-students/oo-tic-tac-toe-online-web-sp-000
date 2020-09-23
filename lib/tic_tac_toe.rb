class TicTacToe

    attr_accessor :board
    
    WIN_COMBINATIONS = [
        [0,1,2], #top row
        [3,4,5], #middle row
        [6,7,8], #bottom row
      
        [0,3,6], #left column
        [1,4,7], #middle column
        [2,5,8], #right column
      
        [0,4,8], #NW - SE
        [2,4,6] #NE - SW
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
        input.to_i - 1
      end
      
      def move (index, token = "X")
        @board[index] = token
      end
      
      def position_taken?(index)
        position = @board[index]
      
        if position == "X" || position == "O"
          true
        else
          false
        end
      end
      
      def valid_move?(index)
        #if (input_in_range?(index) && (!(position_taken?(board, index))))
        if ((index > -1) && (index < 9) && (!(position_taken?(index))))
          return true
          else
            false
        end
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
      
      def turn_count
        count = @board.select{|position| position == "X" || position == "O"}
        count.length
      end
      
      def current_player
        turn_count.even? ? "X" : "O"
      end
      
      def won?
        board_win = false
        WIN_COMBINATIONS.each do |win_combo|
          win_index_1 = win_combo[0]
          win_index_2 = win_combo[1]
          win_index_3 = win_combo[2]
          # check if position is taken
      
          # compare win_combo to corresponding board positions
          if (@board[win_index_1] == "X" && @board[win_index_2] == "X" && @board[win_index_3] == "X") || (@board[win_index_1] == "O" && @board[win_index_2] == "O" && @board[win_index_3] == "O")
            # if they match, that's a win
            board_win = win_combo
          end
          # if not, keep enumerating
        end
        board_win
      end
      
      def full?
        @board.all?{|position| position == "X" || position == "O"}
      end
      
      def draw?
        !won? && full?
      end
      
      def over?
        won? || draw?
      end
      
      def winner
        win = won?
        win ? @board[win[0]] : nil
      end

      def play
        #  is_over = false
        turn until over?
              if won?
                puts "Congratulations #{winner}!"
              elsif draw?
                puts "Cat's Game!"
              end
         end
        
      
end