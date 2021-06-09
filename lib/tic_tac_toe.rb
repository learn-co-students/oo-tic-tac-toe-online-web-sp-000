class TicTacToe

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]
    #creates an empty array board to keep track of the game
    def initialize
      @board = [" "," "," "," "," "," "," "," "," "]
    end

    #used to display the current board whenever needed
    def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    #uses .gets and converts the input into an index value
    def input_to_index(user_input)
      index = user_input.to_i - 1
    end

    #defines a move using the methods below by breaking down a move to component pieces
    def move(index, token = "X")
      @board[index] = token
    end

    #checks board to see if that index is full
    def position_taken?(index)
      if @board[index] == " " || @board[index] == "" || @board[index] == nil
        false
      elsif @board[index] == "X" || @board[index] == "O"
        true
      end
    end

    #checks that the input is inside the range of expected inputs and calls
    #position_taken to nest methods for the game
    def valid_move? (index)
      index.between?(0,8) && !position_taken?(index) ? true : false
    end

    #creates a counter to associate an integer with X and O
    def turn_count
      counter = 0
        @board.each do |turn|
          if turn == "X" || turn == "O"
            counter +=1
          end
        end
      counter
    end

    #takes the turn count and converts it to a current player X or O
    def current_player
      turn_count.even? ? "X" : "O"
    end

    #defines the complete turn cycle inside of a game of tic TicTacToe
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

    #uses the class constant WIN_COMBINATIONS to check against current board
    def won?
      WIN_COMBINATIONS.detect do |combinations|
        position_1 = @board[combinations[0]]
        position_2 = @board[combinations[1]]
        position_3 = @board[combinations[2]]

        position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O" ? true : false
      end
    end

    #checks if there are values @ each position of the board
    def full?
      @board.all? do |pos|
         pos == "X" || pos == "O"
        end
      end

    #calls previous full and won method to determine if cats game
    def draw?
      full? && !won? ? true : false
    end

    #calls won & draw to return a true false to check to see if the game is over
    def over?
      won? || full? ? true : false
    end

    #makes an easily get-able winner
    def winner
      if won?
        @board[won?[0]]
      end
    end

    #defines the complete process of playing using the above methods
    #until the game is over or a draw continue looping inside of turn
    #when game is over call won? if true return winning statement
    #elsif a draw, puts a cat's game
    #ends whole program
    def play
      until over? || draw?
        turn
      end
        if won?
          puts "Congratulations " + winner + "!"
        elsif draw?
          puts "Cat's Game!"
        end
      end

  end
