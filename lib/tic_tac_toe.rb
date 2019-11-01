class TicTacToe

# initialize method displays a new board.
  def initialize()
    @board = Array.new(9, " ")
  end

# WIN_COMBINATIONS constant defines an array of the possible winning combinations in TicTacToe.
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

# display_board method, prints the current board representation based on the @board instance variable.
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

# input_to_index method takes the users input and converts it to a valid index on the board.
    def input_to_index(user_input)
      user_input.to_i - 1
    end

# move method takes the players position selection and sets it to the players character which by default is set to "X".
    def move(position, character = "X")
      @board[position] = character
    end

# position_taken? method checks to see if a position on the board is taken, if the position is not taken it returns false, if the position is taken it returns true.
    def position_taken?(index_i)
      @board[index_i] == "X" || @board[index_i] == "O"
    end

# valid_move? method checks to see if the move is valid.
    def valid_move?(index)
      index.between?(0, 8) && !position_taken(index)
    end

# turn method asks the user to enter a number from 1-9, if the choice is valid then it will display on the board, else it will ask the user to enter a number from 1-9 again.
    def turn
      puts "Please enter a number 1-9:"
      input = gets.strip
      index = input_to_index(input)
      character = current_player
      if valid_move?(index)
        move(index, character)
        display_board
      else
        turn
      end
    end

# turn_count method returns the number of turns that have been played based on the @board variable.
    def turn_count
      number_of_turns = 0
      @board.each do |space|
        if space == "X" || space == "O"
          number_of_turns += 1
        end
      end
        number_of_turns
    end

# current_player method returns it's the turn of player "X" if the turn count is even, else it's the turn of player "O".
      def current_player
        turn_count % 2 == 0 ? "X" : "O"
      end

# won? method checks the WIN_COMBINATIONS to see if any of the combinations are present to the players "X" or "O" and returns the winning combiniation, else it returns false.
      def won?
        WIN_COMBINATIONS.detect do |win_combo|
          if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X"
            return win_combo
          elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O"
            return win_combo
          else
            false
          end
        end
      end


# full? method checks to see if all the board positions are occupied, if they are occupied it returns true, else it returns false.
      def full?
        @board.all?{|occupied| occupied != " "}
      end

# draw? method returns true if the board is not won and all positions are full, else it returns false.
      def draw?
        !(won?) && (full?)
      end

# over? method retruns true if the board has been won or is full or the game is a draw game.
      def over?
        (won?) || (full?) || (draw?)
      end


# winner method checks the winning combinations to see if either player "X" or player "O" has a winning combination, if they do it will return the winners character, else it will return false.
      def winner
        WIN_COMBINATIONS.detect do |win_combo|
          if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X"
            return "X"
          elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O"
            return "O"
          else
          false
        end
      end
    end

# play method is responsible for the game loop. As long as the game is not over it's the next players turn, if the game is won it congratulated the player, if the game is a draw it tells the players is a draw.
    def play
      while over? == false
        turn
      end
      if won?
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cat's Game!"
      end
    end

end
