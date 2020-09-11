require "pry"

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

    def input_to_index(input)
        index = input.to_i - 1
    end 

    def move(index, player = "X")
     @board[index] = player
    end 

    def position_taken?(index)
        if @board[index] == "X" || @board[index] == "O"
            return true
        else index == " " || index == ""
        #Yes you do need the else part, although I'm not sure why.
          end 
    end 

    def valid_move?(index)
        if index.between?(0,8) && position_taken?(index) == false
            return true
          end
    end 

    def turn_count
        #Counting how many turns have gone by, which amounts to how many Xs and Os are on the board
        #Done using an each loop iterating a counter for Xs and Os.
        counter = 0
        @board.each do |position|
            if position == "X" || position == "O"
                counter += 1
            end 
        end 
        counter
    end 

    def current_player
        if turn_count % 2 == 0
            "X"
        else 
            "O"
        end 
    end 

    def turn
        turn_count
        #Iterates into a new turn?

        puts "Please enter 1-9:"
        input = gets.strip
        #Getting the input from the user and taking out whitespace

        index = input_to_index(input)
        #Converting input to an integer/board array index number

        if valid_move?(index) == true
          move(index, current_player)
        #If the desired position passes the test for a valid move, move
        
        else
          puts "That is not a valid move. Please enter 1-9:"
          input = gets.strip
          input_to_index(input)
        end
        #Or else ask for input again

        display_board
      end

      def won?
        won = false
        for win_con in WIN_COMBINATIONS do
            winv1 = win_con[0]
            winv2 = win_con[1]
            winv3 = win_con[2]
            #Assigns variables to each position index for a winning board set.
            
            position_1 = @board[winv1]
            position_2 = @board[winv2]
            position_3 = @board[winv3]
            #Places the position index on the board for...
        
            if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
              won = win_con
            end
            #...checking to see if X or O has a marker in each position for a winning set. 
            #If they do, variable won = the winning set
          end 
          won
          #and per above if no one does the default is false 
          #(DO NOT USE NIL that will screw up your code down-class.)
      end 

      def full?
        @board.all? {|index| index == "X" || index == "O"}
        #Does every place in the board have an X or a O, as opposed to "are there any blank spaces" 
        #which is what you did last time. Both use the all? method.
      end 

      def draw?
        if full? == true && won? == false
          true
        else 
          false
        end 
      end 

      def over?
        if won? != false || draw? == true
          true
        end 
      end 

      def winner
        if won? != false
          #Obv, if there is a winning array...
          @board[won?[0]]
          #Returns the string on the board in the first position of the winning array
          #i.e. won?[0] gives the coordinate on the board to look at, so you wrap it in @board[]
        end 
      end 

      def play
        until over? == true
          turn
        end 
        #Basically what it says on the tin. 
        #Until is better than If b/c it'll keep looping until the over condition is met
        if over? == true && winner == "X"
           puts "Congratulations X!"
         elsif over? == true && winner == "O"
           puts "Congratulations O!"
         else
           puts "Cat\'s Game!"
        end
        #There are three possible outcomes: X Wins, O Wins, Draw
        #The If/Elsif/Else tree covers all of them.
      end 
end