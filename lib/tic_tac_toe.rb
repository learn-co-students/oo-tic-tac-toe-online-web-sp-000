class TicTacToe

    def initialize
        @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end
    WIN_COMBINATIONS = 
    [
        [0,1,2], #top_row_win 
        [3,4,5], #mid_row_win 
        [6,7,8], #low_row_win 
        [0,3,6], #vertical_left_win 
        [1,4,7], #vertical_center_win
        [2,5,8], #vertical_right_win 
        [0,4,8], #diag_left_to_right_win 
        [2,4,6] #diag_right_to_left_wi
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

    def move(index, players_character)
        @board[index] = players_character 
    end 

    def position_taken?(index)
        !(@board[index].nil? || @board[index] == " ")
    end

    def valid_move?(index)
        index.between?(0,8) && !position_taken?(index)
    end 

    def turn_count
        arr = (@board.select{|tokens| tokens == "X" || tokens == "O"}).count
    end 

    def current_player
        if turn_count.even?
            "X"
        elsif turn_count.odd?
            "O"
        end 
    end 

    def turn
      puts 'Please enter 1-9:'
      user_input = gets.strip
      index = input_to_index(user_input)
      if valid_move?(index)
        move(index, current_player)
        display_board
      else
        turn
      end
    end

    def won?
        WIN_COMBINATIONS.each do |combo|
          if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X" 
             return combo 
          end
          if @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O" 
             return combo 
          end 
        end 
        false   
      end 

      def full?
        @board.all?{ |position| position == "X" || position == "O"}
      end 

      def draw?
        full? && !won?
       end 

       def over?
        won? || draw?
      end 

      def winner
        WIN_COMBINATIONS.each do |combo|
            if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]]  == "X"
                return "X"
            elsif
                @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]]  == "O"
                    return "O"
            elsif !won?
                return nil
          end 
        end 
    end 

    def play 
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









