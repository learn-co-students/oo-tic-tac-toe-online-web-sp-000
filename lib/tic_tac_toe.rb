  
class TicTacToe
  
    WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
    ]

    def initialize
        # should set a @board variable equal to a new, empty array that represents the game board
        @board = Array.new(9, " ")
    end

    def display_board
        line = "-----------"
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts line
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts line
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end
 
  def input_to_index(input)
    # can pass user input (in the form of a string, e.g., "1", "5", etc.) and have it return to us the corresponding index of the @board array
    input.to_i - 1
  end
 
  def move(index, token = "X") # second argument, the player's token, should default to "X"
    # must take in two arguments: the index in the @board array that the player chooses and the player's token (either "X" or "O")
    @board[index] = token
  end
 
  def position_taken?(index)
    # will be responsible -> evaluating the user's desired move against the Tic Tac Toe board and checking to see whether or not that position is already occupied
    @board[index] != " "
  end
 
  def valid_move?(index)
    # accepts a position to check and returns true if the move is valid and false or nil if not
    index.between?(0, 8) && !position_taken?(index)
  end
 
  def turn_count
    # returns the number of turns that have been played based on the @board variable
    @board.count{|played| played == "X" || played == "O"}
  end
 
  def current_player
    # should use the #turn_count method to determine if it is "X"'s or "O"'s turn
    turn_count % 2 == 0 ? "X" : "O"
  end
 
  def turn
    # encapsulates the logic of a single complete turn composed of the following routine
    puts "Please enter 1-9:"
    input = gets.chomp #strip
    index = input_to_index(input)
    if valid_move?(index)
        move(index, current_player)
        display_board
    else
        puts "invalid move"
        turn
    end
    end
 
  def won?
    # should return false/nil if there is no win combination present in the board and return the winning combination indexes as an array if there is a win
    # use your WIN_COMBINATIONS constant in this method
    WIN_COMBINATIONS.each do |win_combo|
      if @board[win_combo[0]] == "O" && @board[win_combo[1]] == "O" && @board[win_combo[2]] == "O"
        return win_combo
      elsif @board[win_combo[0]] == "X" && @board[win_combo[1]] == "X" && @board[win_combo[2]] == "X"
        return win_combo
      end
    end
    return false
  end
 
  def full?
    # should return true when every element in the board contains either an "X" or an "O"
    @board.all? {|index| index == "X" || index == "O"}
  end
 
  def draw?
    # returns true if the board is full and has not been won, false if the board is won, and false if the board is neither won nor full
    !won? && full?
  end
 
  def over?
    # returns true if the board has been won or is full (i.e., is a draw)
    won? || draw?
  end
 
  def winner
    if won?
      @board[won?[0]]
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
