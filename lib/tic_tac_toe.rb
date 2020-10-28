class TicTacToe

    def initialize
        @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    WIN_COMBINATIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8],[0,4,8], [2,4,6], [1,4,7], [2,5,8], [0,3,6]
     ]

     def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
      end

      def input_to_index(input)
        input.to_i-1
      end

      def move(index, player)
        @board[index] = player
      end

      def position_taken?(index)
        if @board[index] == " "
            false
        else
            true
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
        @board.count{|box| box != " " }
      end

      def current_player
        turn_count.even? ? "X" : "O"
      end

      def turn
        puts "Enter your move"
        player_move = gets.chomp
        index = input_to_index(player_move)
        player = current_player
        if valid_move?(index)
            move(index, player)
        else 
            turn
        end
            display_board
      end

      def won?
        WIN_COMBINATIONS.any? do |combo|
          if position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
            return combo
          end
        end
      end

      def full?
        @board.all? do |position|
            position == "X" or position == "O"
        end
      end

      def draw?
       full? && !won?
      end

      def over?
        if won?
            true
        else
            draw?
        end
      end

      def winner
        if combo = won?
            @board[combo[1]]
          end
      end

      def play
        turn until over?
        puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
      end
end