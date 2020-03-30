class TicTacToe

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  WIN_COMBINATIONS = [
    [0,1,2], #top row
    [3,4,5], #middle row
    [6,7,8], #bottom row
    [0,4,8], #diagonal from top left corner
    [2,4,6], #diagonal from top right corner
    [0,3,6], #left column
    [1,4,7], #middle column
    [2,5,8] #right column
  ]

  # displays the current state of the board
  def display_board
  row1 = " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  row2 = " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  row3 = " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  line = "-----------"

  puts row1
  puts line
  puts row2
  puts line
  puts row3

end

# converts user input to an index value
def input_to_index(input)
  index = input.to_i - 1
  index
end

# updates the board array with the value of the user's move
def move(index, token="X")
  @board[index] = token
  @board
end

# checks if the chosen position on the board is occupied
def position_taken?(index)
  if @board[index] == " " || @board[index] == "" || @board[index] == nil
    false
  elsif @board[index] == 'X' || @board[index] == 'O'
    true
  end
end

# checks if the user's move is present on the game board and not already filled with a token
def valid_move?(index)
  if position_taken?(index) == false && index.between?(0,8) == true
    true
  else
    false
  end
end

# encapulates the logic of a single complete turn
def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)

  if valid_move?(index)
    move(index, current_player)
    display_board
  else
    puts "Sorry, invalid move :("
    turn
  end
end

# returns the number of turns that have been played
def turn_count
  @board.select {|char| char == 'X' || char == 'O'}.length
end

# returns who is the current player (X or O)
def current_player
  turn_count % 2 == 1 ? 'O' : 'X'
end

def won?
 winner = WIN_COMBINATIONS.detect {|win_comb| win_comb.all? {|token| @board[token] == "X"} || win_comb.all? {|token| @board[token] == "O"}}
 winner
end

# returns true if the whole board is full
def full?
  @board.none? {|el| el == "" || el == " "}
end

# returns true if the board is full but the game has not been won, returns false if the game has not been won and the board is not full or if the game is won
def draw?
  if full?
    won? == nil ? true : false
  else
    false
  end
end

# returns true if the board has been won, is draw or is full
def over?
  if won? != nil || draw? || full?
    true
  else
    false
  end
end

# returns the winner token
def winner
  if won? != nil
    winner_arr_firstindex = won?[0]
    @board[winner_arr_firstindex] == "X" ? "X" : "O"
  end
end

# method responsible for the game loop
def play

  until over?
    turn
  end

  if over?
    if won? != nil
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end

end
