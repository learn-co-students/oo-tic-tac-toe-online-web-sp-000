class TicTacToe
  WIN_COMBINATIONS = [
  [0,1,2], # top_row
  [3,4,5], # middle_row
  [6,7,8], # bottom_row
  [0,3,6], # left_column
  [1,4,7], # center_column
  [2,5,8], # right_column
  [0,4,8], # left_diagonal
  [6,4,2] # right_diagonal
  ]

  def initialize
    # assigns an instance variable @board to an array with 9 blank spaces " "
    @board = Array.new(9, " ")
  end

  def display_board
    #prints arbitrary arrangements of the board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "

  end

  def input_to_index(input)
    #converts the user's input (a string) into an integer
    #converts the user's input from the user-friendly format (on a 1-9 scale) to the array-friendly format
      input.to_i - 1
  end

  def move(index, player_token = "X")
    # allows "X" player in the top left and "O" in the middle
    @board[index] = player_token
  end

  def position_taken?(index)
    #returns true/false based on whether the position on the board is already occupied
    if @board[index] == "" || @board[index] == " " || @board[index] == nil
      false
    else
      true
  end
  end

  def valid_move?(index)
    #returns true/false based on whether the position is already occupied
    #checks that the attempted move is within the bounds of the game board
    if !position_taken?(index) && (index).between?(0,8)
    return true
    else
    return false
  end
  end

  def turn_count
  #counts occupied positions
  @board.count {|element| element == "X" || element == "O"}
  end

  def current_player
    turn_count % 2 == 0? "X" : "O"
  end

  def turn
    #receives user input via the gets method
    puts "Please enter 1-9:"
    input = gets.strip
    #calls #input_to_index, #valid_move?, and #current_player
    index = input_to_index(input)
    if valid_move?(index)
    #makes valid moves and displays the board
    move(index, current_player)
    display_board
    else
    #asks for input again after a failed validation
    turn
    end
  end

  def won?
    #returns false for a draw
    #returns the winning combo for a win
    board_empty = @board.none? { |i| i == "X" || i = "O"}
    if board_empty
      false
    else
    WIN_COMBINATIONS.each do |combo|
    if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X" || @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
    return combo
  end
end
false
end
end

  def full?
    @board.all? { |i| i =="X" || i == "O"}
  end

  def draw?
  !won? && full? ? true : false
  end

  def over?
    if won? || draw?
      true
    else
      false
    end
  end

  def winner
    WIN_COMBINATIONS.detect do |combo|
    if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X"
      return "X"
    elsif @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
      return "O"
    else
      nil
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


end #end of class object
