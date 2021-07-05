require "pry"

class TicTacToe

def initialize
  @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]]

  def display_board
    puts = "Welcome to Tic Tac Toe"
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(input)
  input = input.to_i - 1

end

def move(index, value = "X")
    index = index.to_i
    @board[index] = value

end

def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end

def valid_move?(index)
  if index.between?(0,8)
  if !position_taken?(index)
    true
end
end
end

def turn_count
  counter = 0
  @board.each do |space|
    if space.upcase != " "
      counter += 1
    end
  end
  counter
end

def current_player
  player_turn = turn_count
  if player_turn % 2 == 0
    player = "X"
  else
    player =  "O"
  end
  player
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

def won?
  board_empty = @board.none? { |i| i == "X" || i = "O"}
  if board_empty
    false
  else WIN_COMBINATIONS.each do |combo|
      if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X" || @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
        return combo
      end
    end
    return false
end
end


  def over?
  if draw? || won? || full?
    return true
  end
end

def full?
  if @board.all? {|i| i == "X" || i == "O"}
    return true
  else
    return false
  end
end

def draw?
  !won? && full? ? true : false
end
# return X when X won (FAILED - 1)
# returns O when O won (FAILED - 2)
# returns nil when no winner (FAILED - 3)#

# Given a winning @board, the #winner method should return the token, "X" or "O",
# that has won the game.
def winner
  # won? returns false or the combo of winning spaces
if current_player == "O" && won?
  return "X"
elsif current_player == "X" && won?
  return "O"
else
  return nil
  end
end


#until the game is over
#  take turns
#end

#if the game was won
#  congratulate the winner
#else if the game was a draw
#  tell the players it ended in a draw
#end
def play
    turn until over?
    if won?
      puts "Congratulations #{winner}!"
    else draw?
      puts "Cat's Game!"
    end
end

end
